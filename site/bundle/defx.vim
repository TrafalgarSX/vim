"======================================================================
"
" defx.vim - 
"
" Created by trafalgar on 2023/4/18
" Last Modified: 2023/4/18 01:01:04
"
"======================================================================


" update defx status automatically when changing file 
autocmd BufWritePost * call defx#redraw()
" double click to open file
nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('open')
" quit vim when defx is the only window
autocmd WinClosed * if winnr('$') <= 1 | qall | endif


autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction


" \ 'columns': 'git:mark:filename:type',
" \ 'columns': 'indent:icons:filename:type',
" \ 'columns': 'git:icons:filename:type',
call defx#custom#option('_', {
      \ 'columns': 'git:icons:filename:type',
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" set defx window width
call defx#custom#column('filename', {
	      \ 'min_width': 10,
	      \ 'max_width': 30,
	      \ })

" 修改缩进大小
" call defx#custom#column('indent', {
"     \ 'indent': '',
"     \ })

" explore the folder where the current file is
" :Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`

" open defx window like explorer 
" :Defx -split=vertical -winwidth=50 -direction=topleft

" open file like vimfiler explorer mode
" nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')

" defx root marker
" call defx#custom#option('_', {
" 	      \ 'root_marker': ':',
" 	      \ })
" call defx#custom#column('filename', {
" 	      \ 'root_marker_highlight': 'Ignore',
" 	      \ })



"----------------------------------------------------------------------
" defx-git 
"----------------------------------------------------------------------
"  determines if ignored files should be marked with indicator.
" call defx#custom#column('git', 'show_ignored', 0)
"
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

"----------------------------------------------------------------------
" defx-icons 
"----------------------------------------------------------------------
" may cause performance issue
let g:defx_icons_enable_syntax_highlight = 1

"----------------------------------------------------------------------
" keymap 
"----------------------------------------------------------------------
" noremap <space>tn :exec "Defx " . fnameescape(asclib#path#get_root('%'))<cr>
noremap <space>tn :<C-U>Defx<cr>

