"----------------------------------------------------------------------
" startup
"----------------------------------------------------------------------
let g:asc_uname = asclib#platform#uname()
exec 'set rtp+='. fnameescape(expand('<sfile>:p:h') . '/site/package')

"----------------------------------------------------------------------
" OptImport
"----------------------------------------------------------------------
" TODO 查看每个是什么作用 决定是否引入
" IncScript site/opt/argtextobj.vim
IncScript site/opt/angry.vim
IncScript site/opt/indent-object.vim
IncScript site/opt/after_object.vim
IncScript site/opt/apc.vim


if has('gui_running')
	IncScript site/opt/hexhigh.vim
endif


"----------------------------------------------------------------------
"- Global Settings
"----------------------------------------------------------------------
let g:asyncrun_show_time = 1
let g:asyncrun_rootmarks = ['.project', '.root', '.git', '.git', '.svn']
let g:asyncrun_rootmarks += ['.hg', '.obsidian']
let g:asclib_path_rootmarks = g:asyncrun_rootmarks

if has('patch-8.0.0')
	set shortmess+=c
endif

set cpt=.,w,k

if has('patch-8.2.4500')
	set wildoptions+=pum,fuzzy
	set wildmode=longest,full
	" cnoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
	" cnoremap <expr> <esc> pumvisible() ? "\<c-e>" : "\<esc>"
endif

"----------------------------------------------------------------------
" asclib settings
"----------------------------------------------------------------------

