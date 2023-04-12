set runtimepath+=C:/Users/guoya/.vim/bundles/deoplete.nvim/
let g:deoplete#enable_at_startup = 1

" let g:deoplete#enable_refresh_always = 1
" deoplete#custom#option("refresh_always",{value})

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<bs>"
inoremap <expr><cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

call deoplete#custom#option({
      \ 'auto_complete_delay' :  500,
      \ 'ignore_case'         :  get(g:, 'deoplete#enable_ignore_case', 1),
      \ 'smart_case'          :  get(g:, 'deoplete#enable_smart_case', 1),
      \ 'camel_case'          :  get(g:, 'deoplete#enable_camel_case', 1),
      \ 'refresh_always'      :  get(g:, 'deoplete#enable_refresh_always', 1)
      \ })

call deoplete#custom#option('sources', {
        \ '_': ['buffer', 'dictionary'],
        \ 'cpp': ['clangx'],
        \ 'c': ['clangx'],
		\ 'python': ['jedi'],
        \})

" call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
"
set shortmess+=c
let g:echodoc#enable_at_startup = 1

if exists('g:python_host_prog')
	let g:deoplete#sources#jedi#python_path = g:python_host_prog
endif

" let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#custom#option#jedi#ignore_errors = 0
let g:deoplete#custom#option#jedi#show_docstring = 1
let g:deoplete#custom#option#jedi#enable_typeinfo = 1
let g:deoplete#custom#option#jedi#statement_length = 100
let g:deoplete#custom#option#jedi#ignore_private_members = 0
