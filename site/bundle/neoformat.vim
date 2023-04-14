let g:neoformat_basic_format_trim = 1

let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-'],
    \ }
let g:neoformat_enabled_python = ['black']
" let g:neoformat_enabled_python = ['autopep8', 'black', 'yapf']

" neoformat有默认配置
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


let g:neoformat_enabled_json = ['prettier']

let g:neoformat_json_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--parser', 'json'],
      \ 'stdin': 1,
      \ 'cwd': '.',
      \ }

" run a formatter on save
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
"
noremap <space>nf :Neoformat<CR>

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
