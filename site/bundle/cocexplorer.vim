
" coc-explorer
" let which_key_map2.p ='file tree'
let g:indentLine_fileTypeExclude = ['coc-explorer']

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

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim/vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nmap <space>ev <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

" augroup CocExplorerCustom
" 	autocmd!
" 	autocmd BufEnter call <SID>enter_explorer()
" augroup END

" " hook for explorer window initialized
" function! CocExplorerInited(filetype, bufnr)
" 	" transparent
" 	call setbufvar(a:bufnr, '&winblend', 10)
" endfunction


