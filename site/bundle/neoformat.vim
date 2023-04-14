let g:neoformat_basic_format_trim = 1

" python format
let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-'],
    \ }
let g:neoformat_enabled_python = ['black']
" let g:neoformat_enabled_python = ['autopep8', 'black', 'yapf']

" neoformat有默认配置
" c/c++ format
let g:neoformat_cpp_clangformat = {
     \ 'exe': 'clang-format',
     \ 'style': 'LLVM',
     \ }

let g:neoformat_c_clangformat = {
     \ 'exe': 'clang-format',
     \ 'style': 'LLVM',
     \ }

let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']

" json format 之前不能正常使用是因为cargo中有个莫名其妙
" 的prettier软件，一直输出Hello World
let g:neoformat_json_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
		\ }
let g:neoformat_try_node_exe = 1
let g:neoformat_enabled_json = ['prettier']

" 


" run a formatter on save
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
"
noremap <space>nf :Neoformat<CR>

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
