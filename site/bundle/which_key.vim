let g:which_key_use_floating_win = 1
let g:which_key_disable_default_offset = 1
let g:which_key_max_size = 0

" 改变提示窗口的颜色
hi! default link WhichKeyFloating QuickDefaultPreview

"===========================================================
"  alt keymap
"===========================================================
" 添加 alt键开头的映射  选择x是因为x基本没被用过
nnoremap <silent> <M-x> :<C-u>WhichKey '<M>'<CR>
vnoremap <silent> <M-x> :<C-u>WhichKeyVisual '<M>'<CR>
let g:alt_key_map = get(g:, 'alt_key_map', {})

let g:alt_key_map = {
  \ 'e': 'choosewin',
  \ 'up': 'tabprev',
  \ 'down': 'next',
  \ 't': 'tabnew',
  \ 'w': 'tabclose',
  \ 'v': 'close',
  \ 'z': 'za',
  \ 'a': 'PreviewSignature',
  \ 'F5': 'AsyncTask file-run',
  \ 'F6': 'AsyncTask make',
  \ 'F7': 'AsyncTask emake',
  \ 'F8': 'AsyncTask emake-exe',
  \ 'F9': 'AsyncTask filebuild',
  \ 'F10': 'asyncrun#quickfix_toggle',
  \ 'F1': 'AsyncTask task-f1',
  \ 'F2': 'AsyncTask task-f2',
  \ 'F3': 'AsyncTask task-f3',
  \ 'F4': 'AsyncTask task-f4',
  \}


silent! call which_key#register('<M>', "g:alt_key_map")

"===========================================================
"  tab keymap
"===========================================================
" tab按钮好像没什么好加的
nnoremap <tab><tab> :WhichKey '<tab>'<cr>
vnoremap <tab><tab> :WhichKeyVisual '<tab>'<cr>
let g:tab_key_map = {}
silent! call which_key#register('<tab>', "g:tab_key_map")

"===========================================================
"  space keymap
"===========================================================
" <leader><leader>
nnoremap <space><space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <space><space> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:space_key_map = {}
let g:space_key_map.c = {
  \ 'name': '+buf,gtags',
  \ 'w': 'CdToFileDir',
  \ 'r': 'CdToProjectRoot',
  \ 's': 'Scope symbol',
  \ 'g': 'Scope definition',
  \ 'c': 'Scope functions calling',
  \ 'd': 'Scope functions calling by',
  \ 't': 'Scope string',
  \ 'e': 'Scope egrep',
  \ 'a': 'Scope assigned',
  \ 'f': 'Scope file',
  \ 'i': 'Scope files including',
  \ 'b' : {
    \ 'name': '+update_tags',
    \ '1' : 'ctags .tags',
    \ '2' : 'cs .cscope',
    \ '3' : '! ctags',
    \ '4' : '! cs',
    \ '5' : 'py .cscopy',
    \ '6' : 'py .cscopy',
    \ },
  \}

let g:space_key_map.l = {
    \ 'name' : '+linting',
    \ 'p' : 'lint_pylint',
    \ 'f' : 'lint_flake8',
    \ 'g' : 'opengprof',
	\ 't' : 'html_prettify',
    \}

let g:space_key_map['f'] = {
  \ 'name': '+fuzzy-finder',
  \ 'f': 'file',
  \ 'e': 'filer',
  \ 'b': 'buffer',
  \ 'm': 'mru',
  \ 'g': 'gtags',
  \ 'r': 'rg',
  \ 'n': 'function',
  \ 't': 'tag',
  \ 'u': 'bufTag',
  \ 's': 'self',
  \ 'c': 'colorscheme',
  \ 'y': 'cmdHistory',
  \ 'j': 'jumps',
  \ 'p': 'snippet',
  \ 'q': 'quickfix',
  \ 'a': 'tasks',
  \ 'd': 'filer %p:h',
  \ 'w': 'SwitchHeader edit',
  \ 'h': 'SwitchHeader vsplit',
  \ }

let g:space_key_map.j = {
      \ 'name' : '+make',
      \ 'j' : 'make',
      \ 'c' : 'make clean',
      \ 'k' : '4 make run',
	  \ 'l' : '4 make test',
	  \ 'm' : 'SwitchMakeFile',
      \ '1' : '4 make t1',
      \ '2' : '4 make t2',
      \ '3' : '4 make t3',
	  \ '4' : '4 make t4',
	  \ '5' : '4 make t5',
      \ }

let g:space_key_map.k = {
      \ 'name' : '+kmake,CocList',
      \ '1' : 'make t1',
      \ '2' : 'make t2',
      \ '3' : 'make t3',
	  \ '4' : 'make t4',
	  \ '5' : 'make t5',
	  \ 'ka' : 'CocList diagnostics',
	  \ 'ke' : 'CocList extensions',
	  \ 'kc' : 'CocList commands',
	  \ 'ko' : 'CocList outline',
	  \ 'ks' : 'CocList symbols',
	  \ 'kj' : 'CocNext',
	  \ 'kk' : 'CocPrev',
	  \ 'kp' : 'CocListResume',
      \ }

let g:space_key_map.a = {
      \ 'name' : '+Useless',
      \ 't' : 'CheatSheetAlign',
      \ 'b' : 'BraceExpand',
      \ }

let g:space_key_map.b = {
      \ 'name' : '+buffer_close',
      \ 'c' : 'buffer close',
      \ }

let g:space_key_map.e = {
      \ 'name' : '+snippet',
      \ '-' : 'block-',
      \ '=' : 'block=',
      \ '#' : 'block#',
	  \ 'c' : 'copyright',
	  \ 'b' : 'bundle',
	  \ 'm' : 'main',
	  \ 'l' : 'modeline',
	  \ 't' : 'strftime',
      \ }

let g:space_key_map.m = {
      \ 'name' : '+scope',
      \ 'g' : 'Definition',
      \ 's' : 'Symbol',
      \ 'd' : 'Called by',
      \ 'c' : 'Function Calling',
	  \ 't' : 'Text string',
	  \ 'e' : 'Egrep pattern',
	  \ 'f' : 'Find file',
	  \ 'i' : 'Files including',
      \ }

" 语法检查, 没甚用处
let g:space_key_map.r = {
      \ 'name' : '+grammarous',
      \ 'g' : 'GrammarousCheck',
      \ 'r' : 'open-info-window',
      \ 'v' : 'move-to-info-window',
	  \ 's' : 'reset',
      \ 'x' : 'close-info-window',
      \ 'm' : 'remove-error',
      \ 'd' : 'disable-rule',
	  \ 'n' : 'move-to-next-error',
	  \ 'p' : 'move-to-previous-error',
      \ }

let g:space_key_map.n = {
      \ 'name' : '+svn',
	  \ 'f' : 'Neoformat',
      \ }

let g:space_key_map.t = {
      \ 'name' : '+nerdtree',
      \ }
let g:space_key_map.h = {
      \ 'name' : '+switchfile',
      \ }




call which_key#register('<Space>', "g:space_key_map")

" svn相关用不上
" let g:space_key_map.s = {
"   \ 'name': '+svn',
"   \ 'c': 'svn commit',
"   \ 'u': 'svn up',
"   \ 't': 'svn st',
"   \ }

" space没有以 w为前缀的 map
" let g:space_key_map.w = {
"   \ 'name': '+window',
"   \ 'p': ['<C-w>p', 'jump-previous-window'],
"   \ 'h': ['<C-w>h', 'jump-left-window'],
"   \ 'j': ['<C-w>j', 'jump-belowing-window'],
"   \ 'k': ['<C-w>k', 'jump-aboving-window'],
"   \ 'l': ['<C-w>l', 'jump-right-window'],
"   \ 'H': ['<C-w>H', 'move-window-to-left'],
"   \ 'J': ['<C-w>J', 'move-window-to-bottom'],
"   \ 'K': ['<C-w>K', 'move-window-to-top'],
"   \ 'L': ['<C-w>L', 'move-window-to-right'],
"   \ 'n': ['<C-w>n', 'new-window'],
"   \ 'q': ['<C-w>q', 'close-window'],
"   \ 'w': ['<C-w>w', 'jump-next-window'],
"   \ 'o': ['<C-w>o', 'close-all-other-windows'],
"   \ 'v': ['<C-w>v', 'vertically-split-window'],
"   \ 's': ['<C-w>s', 'split-window'],
"   \ '/': [':Leaderf window', 'search-for-a-window'],
"   \ }

" let g:space_key_map.x = {
"   \ 'name': '+lsp',
"   \ 'a': ['<Plug>(coc-codeaction-selected)', 'do-code-action-on-region'],
"   \ 'A': ['<Plug>(coc-codeaction)', 'do-code-action-on-line'],
"   \ 'r': ['<Plug>(coc-references)', 'find-references'],
"   \ 'R': ['<Plug>(coc-rename)', 'rename-current-symbol'],
"   \ 'f': ['CocAction("format")', 'format-buffer'],
"   \ '=': ['<Plug>(coc-format-selected)', 'format-region'],
"   \ 'k': ["CocAction('doHover')", 'show-documentation'],
"   \ 'q': ['<Plug>(coc-fix-current)', 'fix-line'],
"   \ 'l': {
"   \     'name': '+lists',
"   \     'a': [':CocList --normal actions', 'list-code-actions'],
"   \     'e': [':CocList --normal diagnostics', 'list-errors']
"   \ },
"   \ }

" 后续添加 [_key_map再添加
" let g:space_key_map.b = {
"       \ 'name' : '+buffer' ,
"       \ '1' : ['b1'        , 'buffer 1']        ,
"       \ '2' : ['b2'        , 'buffer 2']        ,
"       \ 'd' : ['bd'        , 'delete-buffer']   ,
"       \ 'f' : ['bfirst'    , 'first-buffer']    ,
"       \ 'h' : ['Startify'  , 'home-buffer']     ,
"       \ 'l' : ['blast'     , 'last-buffer']     ,
"       \ 'n' : ['bnext'     , 'next-buffer']     ,
"       \ 'p' : ['bprevious' , 'previous-buffer'] ,
"       \ '?' : ['Buffers'   , 'fzf-buffer']      ,
"       \ }
