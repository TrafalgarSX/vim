" vim: set ts=4 sw=4 tw=78 noet :
"======================================================================
"
" charkey.vim - 
"
" Created by skywind on 2022/10/26
" Last Modified: 2022/10/26 22:06
"
"======================================================================

let s:special_names = {
			\ "\<esc>" : "<esc>",
			\ "\<space>" : "<space>",
			\ "\<cr>" : "<cr>",
			\ "\<tab>" : "<tab>",
			\ "\<bs>" : "<bs>",
			\ "\<Bar>": '<bar>',
			\ "\<Bslash>": '<Bslash>',
			\ "\<Up>": '<up>',
			\ "\<Down>": '<down>',
			\ "\<Left>": '<left>',
			\ "\<Right>": '<right>',
			\ "\<PageUp>" : '<PageUp>',
			\ "\<PageDown>" : '<PageDown>',
			\ "\<Home>" : '<home>',
			\ "\<End>" : '<end>',
			\ "\<Insert>" : '<insert>',
			\ "\<Del>" : '<del>',
			\ "\<LeftMouse>": '<LeftMouse>',
			\ "\<RightMouse>": '<RightMouse>',
			\ "\<MiddleMouse>": '<MiddleMouse>',
			\ "\<2-LeftMouse>": '<2-LeftMouse>',
			\ "\<C-LeftMouse>": '<C-LeftMouse>',
			\ "\<S-LeftMouse>": '<S-LeftMouse>',
			\ "\<ScrollWheelUp>": '<ScrollWheelUp>',
			\ "\<ScrollWheelDown>": '<ScrollWheelDown>',
			\ "\<C-Space>": '<C-Space>',
			\ "\<C-Left>": '<C-Left>',
			\ "\<C-Right>": '<C-Right>',
			\ "\<S-Left>": '<S-Left>',
			\ "\<S-Right>": '<S-Right>',
			\ }


let pending = []

for key in range(26)
	let pending += [nr2char(char2nr('a') + key)]
	let pending += [nr2char(char2nr('A') + key)]
endfor

for key in range(10)
	let pending += [nr2char(char2nr('0') + key)]
endfor

for ch in pending
	let cc = eval('"\<c-' . ch . '>"')
	if !has_key(s:special_names, cc)
		let s:special_names[cc] = '<c-'. ch . '>'
	endif
	let cc = eval('"\<m-' . ch . '>"')
	let s:special_names[cc] = '<m-'. ch . '>'
	let s:special_names[ch] = ch
endfor

let pending = '!@#$%^&*-=_+;:,./?`~'

for ch in pending
	let s:special_names[ch] = ch
endfor

let s:special_keys = {}

for key in keys(s:special_names)
	let ch = s:special_names[key]
	if len(ch) > 1
		let ch = tolower(ch)
	endif
	let s:special_keys[ch] = key
endfor

let s:char_display = {
			\ "<cr>" : "RET",
			\ "<space>" : "SPC",
			\ "<escape>" : "ESC",
			\ "<esc>" : "ESC",
			\ "<return>" : "RET",
			\ "<tab>" : "TAB",
			\ "<bs>" : "BSP", 
			\ "<home>" : "HOME", 
			\ "<end>" : "END", 
			\ "<pageup>" : "PGUP", 
			\ "<pagedown>" : "PGDN", 
			\ "<insert>" : "INS",
			\ "<del>" : "DEL",
			\ }


"----------------------------------------------------------------------
" translate from key-name '<esc>' to key-code '\<esc>'
"----------------------------------------------------------------------
function! starter#charname#get_key_code(key)
	let key = a:key
	if type(key) == v:t_none
		return v:none
	elseif len(key) == 1
		if has_key(s:special_names, key)
			return key
		endif
	elseif stridx(key, '<') == 0
		let lowkey = tolower(key)
		if has_key(s:special_keys, key)
			return s:special_keys[key]
		elseif has_key(s:special_keys, lowkey)
			return s:special_keys[lowkey]
		endif
	endif
	return v:none
endfunc


"----------------------------------------------------------------------
" get a proper key-name from key-code
"----------------------------------------------------------------------
function! starter#charname#get_key_name(code)
	return get(s:special_names, a:code, v:none)
endfunc


"----------------------------------------------------------------------
" get key-label from key-name
"----------------------------------------------------------------------
function! starter#charname#get_key_label(key)
	let code = starter#charname#get_key_code(a:key)
	if type(code) == v:t_none
		return 'BADKEY'
	endif
	if !has_key(s:special_names, code)
		return 'BADKEY'
	endif
	let display = s:special_names[code]
	return get(s:char_display, tolower(display), display)
endfunc


"----------------------------------------------------------------------
" input a array of key-names and sort by their display-names
"----------------------------------------------------------------------
function! starter#charname#sort(keys)
	let buckets = {}
	for key in a:keys
		let label = starter#charname#get_key_label(key)
		if type(label) == v:t_none
			continue
		elseif label == '' && type(label) == v:t_string
			continue
		endif
		let size = len(label)
		if !has_key(buckets, size)
			let buckets[size] = []
		endif
		let buckets[size] += [[key, label]]
	endfor
	let names = keys(buckets)
	let result = []
	call sort(names, 'n')
	call reverse(names)
	for key in names
		let bucket = buckets[key]
		call sort(bucket, { i1, i2 -> (i1[1] > i2[1])? 1 : -1 })
		for item in bucket
			let result += [item[0]]
		endfor
	endfor
	return result
endfunc


