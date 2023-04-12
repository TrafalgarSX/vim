"----------------------------------------------------------------------
" windows
"----------------------------------------------------------------------
let s:windows = g:bundle#windows
let g:ale_disable_lsp = 1

"----------------------------------------------------------------------
" ale
"----------------------------------------------------------------------
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 100
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_virtualtext_cursor = 0

let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

"----------------------------------------------------------------------
" key mapping
"----------------------------------------------------------------------
nmap <Space>en <Plug>(ale_next)
nmap <Space>ep <Plug>(ale_previous)
nnoremap <Space>ts :ALEToggle<CR>

"----------------------------------------------------------------------
" wrapper
"----------------------------------------------------------------------
if s:windows == 0 && has('win32unix') == 0
	let g:ale_command_wrapper = 'nice -n5'
endif

let g:airline#extensions#ale#enabled = 1


"----------------------------------------------------------------------
" linters
"----------------------------------------------------------------------
let g:ale_linters = {
			\ 'c': ['clangtidy'],
			\ 'cpp': ['clangtidy'],
			\ 'python': ['flake8'],
			\ 'lua': ['luac'],
			\ 'go': ['go build', 'gofmt'],
			\ 'java': ['javac'],
			\ 'javascript': ['eslint'],
			\ }

function! s:lintcfg(name)
	let conf = bundle#path('tools/conf/')
	let path1 = conf . a:name
	let path2 = expand('~/.vim/linter/'. a:name)
	return shellescape(filereadable(path2)? path2 : path1)
endfunc

let s:platform = ''

if has('win32')
	let s:platform = '-Id:/dev/local/include'
endif

let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
let g:ale_python_pylint_options .= ' --disable=W'
let g:ale_c_gcc_options = '-Wall -O2 -std=c99 ' . s:platform
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14 ' . s:platform
let g:ale_c_clang_options = '-Wall -O2 ' . s:platform
let g:ale_cpp_clang_options = '-Wall -O2 ' . s:platform
let g:ale_c_cc_options = '-Wall -std=c99 ' . s:platform
let g:ale_cpp_cc_options = '-Wall -std=c++14 ' . s:platform
let g:ale_lua_luacheck_options = '-d'
let g:ale_c_splint_options = '-f '. s:lintcfg('splint.conf')

if executable('gcc') == 0 && executable('clang')
	let g:ale_linters.c += ['clang']
	let g:ale_linters.cpp += ['clang']
endif

" let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']
" let g:ale_linters.lua += ['luacheck']


"----------------------------------------------------------------------
" cppcheck
"----------------------------------------------------------------------
let s:cppcheck = '--enable=warning,style,portability,performance'
let s:cppcheck .= ' --suppressions-list=' . s:lintcfg('cppcheck.conf')


" let s:cppcheck .= ' --inline-suppr'
let g:ale_c_cppcheck_options = s:cppcheck
let g:ale_cpp_cppcheck_options = s:cppcheck


