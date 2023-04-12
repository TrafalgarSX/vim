
" coc-explorer
" let which_key_map2.p ='file tree'

function! s:coc_list_current_dir(args)
	let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
	execute 'cd ' . fnamemodify(node_info['fullpath'], ':h')
	execute 'CocList ' . a:args
endfunction

" function! s:init_explorer(bufnr)
" 	call setbufvar(a:bufnr, '&winblend', 50)
" endfunction

function! s:enter_explorer()
	if !exists('b:has_enter_coc_explorer') && &filetype == 'coc-explorer'
		" more mappings
		nmap <buffer> <Leader>fg :call <SID>coc_list_current_dir('-I grep')<CR>
		nmap <buffer> <Leader>fG :call <SID>coc_list_current_dir('-I grep -regex')<CR>
		nmap <buffer> <C-p> :call <SID>coc_list_current_dir('files')<CR>
		let b:has_enter_coc_explorer = v:true
	endif
	" statusline
	setl statusline=coc-explorer
endfunction

" augroup CocExplorerCustom
" 	autocmd!
" 	autocmd BufEnter call <SID>enter_explorer()
" augroup END

" " hook for explorer window initialized
" function! CocExplorerInited(filetype, bufnr)
" 	" transparent
" 	call setbufvar(a:bufnr, '&winblend', 10)
" endfunction

