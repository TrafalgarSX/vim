" vim: set ts=4 sw=4 tw=78 noet :
"======================================================================
"
" lsp.vim - LSP config
"
" Created by skywind on 2022/12/05
" Last Modified: 2022/12/06 03:51
"
"======================================================================


"----------------------------------------------------------------------
" turning lsp
"----------------------------------------------------------------------
let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_completion_documentation_enabled = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0

let g:lsp_signature_help_enabled = 1
let g:lsp_document_highlight_enabled = 1
let g:lsp_preview_fixup_conceal = 1
let g:lsp_hover_conceal = 1
let g:asyncomplete_smart_completion = 1


"----------------------------------------------------------------------
" turning completion
"----------------------------------------------------------------------
let g:asyncomplete_min_chars = 0
let g:asyncomplete_auto_completeopt = 0

" set completeopt=menuone,noinsert,noselect,preview

set shortmess+=c

"----------------------------------------------------------------------
" popup
"----------------------------------------------------------------------
hi! PopupWindow ctermbg=236 guibg=#303030

function! s:preview_open()
	let wid = lsp#document_hover_preview_winid()
	hi! PopupWindow ctermbg=236 guibg=#303030
	echom "popup opened"
	if has('nvim') == 0
		call setwinvar(wid, '&wincolor', 'PopupWindow')
		" call win_execute(wid, 'syn clear')
		" call win_execute(wid, 'unsilent echom "ft: " . &ft')
	else
		call nvim_win_set_option(wid, 'winhighlight', 'Normal:PopupWindow')
	endif
endfunc

function! s:preview_close()
endfunc

augroup Lsp_FloatColor2
	au!
	autocmd User lsp_float_opened call s:preview_open()
	autocmd User lsp_float_closed call s:preview_close()
augroup END


"----------------------------------------------------------------------
" keymaps
"----------------------------------------------------------------------
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunc

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ asyncomplete#force_refresh()

" inoremap <silent><expr> .  ("." . asyncomplete#force_refresh())

nnoremap gd :LspDefinition<CR>
nnoremap  gr <plug>(lsp-references)
nnoremap  gi <plug>(lsp-implementation)
nnoremap  gt <plug>(lsp-type-definition)
" nmap <buffer> <leader>rn <plug>(lsp-rename)
nnoremap  [g <Plug>(lsp-previous-diagnostic)
nnoremap  ]g <Plug>(lsp-next-diagnostic)
" nmap <buffer> K <plug>(lsp-hover)


"----------------------------------------------------------------------
" asyncomplete settings
"----------------------------------------------------------------------
"blacklist  \ 'blacklist': ['go','vim'],
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
	\ 'name': 'buffer',
	\ 'whitelist': ['*'],
	\ 'blacklist': ['go'],
	\ 'completor': function('asyncomplete#sources#buffer#completor'),
	\ }))

" auto register 不需要自己加
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#lsp#get_source_options({
" 	\ 'name': 'lsp',
" 	\ 'whitelist': ['*'],
" 	\ 'blacklist': [],
" 	\ 'completor': function('asyncomplete#sources#lsp#completor'),
" 	\ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))

"----------------------------------------------------------------------
" vim-lsp-settings
"----------------------------------------------------------------------
let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

