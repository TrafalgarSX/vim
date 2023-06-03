
"----------------------------------------------------------------------
"- Quickfix Chinese Convertion
"----------------------------------------------------------------------
function! QuickfixChineseConvert()
   let qflist = getqflist()
   for i in qflist
	  let i.text = iconv(i.text, "gbk", "utf-8")
   endfor
   call setqflist(qflist)
endfunction


"----------------------------------------------------------------------
"- GUI Setting
"----------------------------------------------------------------------
function! s:GuiTheme(theme)
	if type(a:theme) == 0
		let l:theme = string(a:theme)
	else
		let l:theme = a:theme
	endif
	if l:theme == '0'
		set guifont=FuraMono\ NFM:h11
		color onedark
		highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
			\ gui=NONE guifg=DarkGrey guibg=NONE
	elseif l:theme == '1'
		set guifont=Hack\ NFM:h11
		color seoul256
	elseif l:theme == '2'
		set guifont=fixedsys:h10
		color seoul256
		FontBoldOff
	endif
endfunc

command! -nargs=1 GuiTheme call s:GuiTheme(<f-args>)


"----------------------------------------------------------------------
" remove signs
"----------------------------------------------------------------------
function! s:GuiSignRemove(...)
	if a:0 == 0 | return | endif
	redir => x
	silent sign place
	redir END
	let lines = split(x, '\n')
	for line in lines
		if line =~ '^\s*line=\d*\s*id=\d*\s*name='
			let name = matchstr(line, '^\s*line=.*name=\zs\w*')
			let id = matchstr(line, '^\s*line=\d*\s*id=\zs\w*')
			for x in range(a:0)
				if name == a:{x + 1}
					silent exec 'sign unplace '.id
				endif
			endfor
		endif
	endfor
endfunc

command! -nargs=+ GuiSignRemove call s:GuiSignRemove(<f-args>)



"----------------------------------------------------------------------
" Update Highlight
"----------------------------------------------------------------------
function! s:GuiThemeHighlight()
	highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
		\ gui=NONE guifg=DarkGrey guibg=NONE
	highlight Pmenu guibg=darkgrey guifg=black
endfunc

command! -nargs=0 GuiThemeHighlight call s:GuiThemeHighlight()



"----------------------------------------------------------------------
" GUI detection
"----------------------------------------------------------------------
let g:asc_gui = 0

if has('gui_running')
	let g:asc_gui = 1
endif


"----------------------------------------------------------------------
"- GUI Setting
"----------------------------------------------------------------------

if has('gui_running')
	set guioptions-=L
	set mouse=a
	set showtabline=2
	set laststatus=2
	set number
	set t_Co=256
	let g:seoul256_background = 236
	let g:asc_gui = 1
	if has('win32') || has('win64') || has('win16') || has('win95')
		language messages en
		" 打开gvim就全屏
		au GUIEnter * simalt ~x
		set langmenu=en_US
		set guifont=Hack\ NFM:h11
		winpos 100 100
		set lines=60 columns=200

		"set guifont=fixedsys
		"au QuickfixCmdPost make call QuickfixChineseConvert()
		let g:config_vim_tab_style = 3
		"color desert256
		try
			" color gruvbox
			" color gruvbox-material
			" color sonokai
			" color ayu
			" color agterglow
			color onedark
		catch
		endtry
		set guioptions-=t
		set guioptions=egr
		" T是 工具栏的意思 m是菜单栏的意思
		" set guioptions=egrmT
		" 
		au GuiEnter * set t_vb=

	elseif has('gui_macvim')
		color seoul256
		set guioptions=egrm
	endif
	highlight Pmenu guibg=darkgrey guifg=black
	highlight Comment  gui=NONE
else
	set t_Co=256 t_md=
endif


"----------------------------------------------------------------------
" Purify NVim-Qt
"----------------------------------------------------------------------
function! s:GuiPureNVim()
	if has('nvim') && g:asc_gui
		call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
		call rpcnotify(0, "Gui", "Option", "Popupmenu", 0)
	endif
endfunc

command! -nargs=0 GuiPureNVim call s:GuiPureNVim()



