"----------------------------------------------------------------------
" system detection
"----------------------------------------------------------------------
let s:uname = asclib#platform#uname()
let g:bundle#uname = s:uname
let g:bundle#windows = (s:uname == 'windows')? 1 : 0


"----------------------------------------------------------------------
" include script
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if !exists(':IncScript')
	command! IncScript -nargs=1 exec 'so ' . fnameescape(s:home .'/<args>')
endif

function! bundle#path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

function! s:path(path)
	return bundle#path(a:path)
endfunc



"----------------------------------------------------------------------
" packages begin
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = []
endif

let g:bundle_enabled = {}
for key in g:bundle_group | let g:bundle_enabled[key] = 1 | endfor
let s:enabled = g:bundle_enabled


call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

"----------------------------------------------------------------------
" package group - simple
"----------------------------------------------------------------------
if has_key(s:enabled, 'time')
    Plug 'tweekmonster/startuptime.vim'
endif


"----------------------------------------------------------------------
" package group - simple
"----------------------------------------------------------------------
if has_key(s:enabled, 'simple')
	Plug 'easymotion/vim-easymotion'
	" auto complete brackets
	Plug 'Raimondi/delimitMate'
	" Path navigator
	Plug 'justinmk/vim-dirvish'
	" 快速跳转
	Plug 'justinmk/vim-sneak'
	" git command
	Plug 'tpope/vim-fugitive'
	" [ ] 相关的快捷键
    Plug 'tpope/vim-unimpaired'
	" fast,powerful git branch viewer for vim
	Plug 'rbong/vim-flog'
	" align text
	Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
	"  easily to d, c, a, y in parentheses,bracket,quotes xml tags
	"  delete ds, add yss, change cs
	Plug 'tpope/vim-surround'
	"guoyawen added
	Plug 'machakann/vim-highlightedyank'
	"comments-auto 可操作文本对象
	Plug 'tpope/vim-commentary'
	" 缩进指示线
	Plug 'Yggdroot/indentLine'
	" 彩虹括号
	Plug 'luochen1990/rainbow'
	"switch keyboard
	" Plug 'Neur1n/neuims'
	" Plug 'romainl/vim-cool'
	" 反义词
	" Plug 'bootleq/vim-cycle'

	nnoremap gb= :Tabularize /=<CR>
	vnoremap gb= :Tabularize /=<CR>
	nnoremap gb: :Tabularize /:\zs<CR>
	vnoremap gb: :Tabularize /:\zs<CR>
	nnoremap gb/ :Tabularize /\/\//l4c1<CR>
	vnoremap gb/ :Tabularize /\/\//l4c1<CR>
	nnoremap gb* :Tabularize /\/\*/l4c1<cr>
	vnoremap gb* :Tabularize /\/\*/l4c1<cr>
	nnoremap gb, :Tabularize /,/r0l1<CR>
	vnoremap gb, :Tabularize /,/r0l1<CR>
	nnoremap gbl :Tabularize /\|<cr>
	vnoremap gbl :Tabularize /\|<cr>
	nnoremap gbc :Tabularize /#/l4c1<cr>
	vnoremap gbc :Tabularize /#/l4c1<cr>
	nnoremap gb<bar> :Tabularize /\|<cr>
	vnoremap gb<bar> :Tabularize /\|<cr>
	nnoremap gbr :Tabularize /\|/r0<cr>
	vnoremap gbr :Tabularize /\|/r0<cr>
	map f <Plug>Sneak_s
	map F <Plug>Sneak_S

	IncScript site/bundle/dirvish.vim
	" IncScript site/bundle/cycle.vim
	IncScript site/bundle/easymotion.vim
	IncScript site/bundle/git.vim
endif

"----------------------------------------------------------------------
" package group - basic
"----------------------------------------------------------------------
if has_key(s:enabled, 'basic')
	" navigate to the window you choose
	Plug 't9md/vim-choosewin'
	" GitHub extension for fugitive
	Plug 'tpope/vim-rhubarb'
	" 启动页面
	Plug 'mhinz/vim-startify'
	" 提供常用函数给其他插件
	Plug 'xolox/vim-misc'
	"allows you to visually select increasingly larger regions
	Plug 'terryma/vim-expand-region'
	Plug 'skywind3000/vim-dict'
	" easy text exchange operator for vim
	Plug 'tommcdo/vim-exchange'
	" align插件， gl (left)  gL (right)
	Plug 'tommcdo/vim-lion'

	Plug 'pprovost/vim-ps1', { 'for': 'ps1' }
	Plug 'tbastos/vim-lua', { 'for': 'lua' }
	" Plug 'vim-python/python-syntax', { 'for': ['python'] }
	Plug 'sheerun/vim-polyglot'
	Plug 'pboettch/vim-cmake-syntax'
	Plug 'skywind3000/vim-flex-bison-syntax', { 'for': ['yacc', 'lex'] }
	Plug 'lark-parser/vim-lark-syntax'
	Plug 'preservim/vim-markdown'


	" , { 'for': ['cmake'] }
	" 基本上用不到的语言支持
	" Plug 'dylon/vim-antlr'
	" Plug 'beyondmarc/hlsl.vim'
	" Plug 'peterhoeg/vim-qml'
	" Plug 'tpope/vim-eunuch'
	" Plug 'dag/vim-fish'
	" Plug 'jamessan/vim-gnupg'

	" 新增的文本对象，以后再研究
	" Plug 'kana/vim-textobj-user'
	" Plug 'kana/vim-textobj-indent'
	" Plug 'kana/vim-textobj-syntax'
	" Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
	" Plug 'sgur/vim-textobj-parameter'
	" Plug 'bps/vim-textobj-python', {'for': 'python'}
	" Plug 'jceb/vim-textobj-uri'

	if !has_key(s:enabled, 'syntax-extra')
		Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
	else
		Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
	endif

	if has('python3') || has('python')
		Plug 'Yggdroot/LeaderF'
		Plug 'tamago324/LeaderF-filer'
		Plug 'voldikss/LeaderF-emoji'
		IncScript site/bundle/leaderf.vim
	else
		Plug 'ctrlpvim/ctrlp.vim'
		Plug 'tacahiroy/ctrlp-funky'
		let g:ctrlp_map = ''
		noremap <c-p> :cclose<cr>:CtrlP<cr>
		noremap <c-n> :cclose<cr>:CtrlPMRUFiles<cr>
		noremap <m-p> :cclose<cr>:CtrlPFunky<cr>
		noremap <m-n> :cclose<cr>:CtrlPBuffer<cr>
	endif

	" noremap <space>ht :Startify<cr>
	" noremap <space>hy :tabnew<cr>:Startify<cr>

	" let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_class_decl_highlight = 1
	" let g:cpp_experimental_simple_template_highlight = 1
	let g:cpp_concepts_highlight = 1
	" let g:cpp_no_function_highlight = 1
	let g:cpp_posix_standard = 1

	let g:python_highlight_builtins = 1
	let g:python_highlight_builtin_objs = 1
	let g:python_highlight_builtin_types = 1
	let g:python_highlight_builtin_funcs = 1

	nmap <m-e> <Plug>(choosewin)
	map <m-+> <Plug>(expand_region_expand)
	map <m-_> <Plug>(expand_region_shrink)
endif


"----------------------------------------------------------------------
" package group - high
"----------------------------------------------------------------------
if has_key(s:enabled, 'high')
	" (Jump) Plugin to toggle, display and navigate marks
	Plug 'kshenoy/vim-signature'
	" show a diff using vim its sign column support git...
	" Similar plugin for git: vim-gitgutter
	Plug 'mhinz/vim-signify'
	" command-line fuzzy finder
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	" Text outlining and task management for vim
	" Plug 'jceb/vim-orgmode', { 'for': 'org' }
	" 日历插件
	Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
	" windows不支持？
	" Plug 'francoiscabrol/ranger.vim'
	" 格式化插件
	Plug 'sbdchd/neoformat'
	" automatic table creator & formatter allowing one to create neat tables
	Plug 'dhruvasagar/vim-table-mode', {'on':[]}

	if has('python3') || has('python2')
		" 与neoformat重复, neoformat貌似更好
		" Plug 'chiel92/vim-autoformat'
		" 实时自动格式化插件，写完一行就format
		Plug 'skywind3000/vim-rt-format'
		" IncScript site/bundle/autoformat.vim
	endif

	IncScript site/bundle/neoformat.vim

	let g:errormarker_disablemappings = 1
	nnoremap <silent> <leader>cm :ErrorAtCursor<CR>
	nnoremap <silent> <leader>cM :RemoveErrorMarkers<cr>

	let g:ranger_map_keys = 0
	let g:table_mode_corner='|'
end

"----------------------------------------------------------------------
" package group - inter
"----------------------------------------------------------------------
if has_key(s:enabled, 'inter')
	" vim的一些函数库
	Plug 'vim-scripts/L9'
	" 记录note的插件
	" Plug 'xolox/vim-notes', { 'on': ['Note', 'SearchNotes', 'DeleteNotes', 'RecentNotes'] }
	" org-mode 的类似插件
	" Plug 'skywind3000/vimoutliner', { 'for': 'votl' }
	" vim interface to web API
	Plug 'mattn/webapi-vim'
	" vim plugin for Gist  post, create, edit, delete, fork Gist
	Plug 'mattn/gist-vim'

	if 1
		" Vimscript library of common functions
		Plug 'inkarkat/vim-ingo-library'
		" Highlight serveral words in different colors simulaneously
		" Plug 'inkarkat/vim-mark'
	else
		Plug 'lifepillar/vim-cheat40',
	endif

	" org-mode类似插件,用不上
	" IncScript site/bundle/outliner.vim
	"
		if !isdirectory(expand('~/.vim/notes'))
		silent! call mkdir(expand('~/.vim/notes'), 'p')
	endif

endif

"----------------------------------------------------------------------
" package group - opt
"----------------------------------------------------------------------
if has_key(s:enabled, 'opt')
	" A text searching plugin mimics <C-S-f>
	Plug 'dyng/ctrlsf.vim'
	" 生成日期
	Plug 'tpope/vim-speeddating'
	" 翻译插件, 将英文翻译成中文, 暂时不用
	" Plug 'voldikss/vim-translator'
	" Plug 'tpope/vim-apathy'
	" Plug 'mh21/errormarker.vim'

	if executable('tmux')
		Plug 'benmills/vimux'
	endif
    Plug 'skywind3000/gutentags_plus'
	Plug 'skywind3000/vim-gutentags'

    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
	" Plug 'itchyny/vim-cursorword'
	
	" if len(g:gutentags_modules) > 0
	" 	" Plug 'ludovicchabant/vim-gutentags'
	" 	" management of tags files in vim
	" 	Plug 'skywind3000/vim-gutentags'
	" endif

	if s:uname == 'windows'
		let g:python3_host_prog="python"
	endif

	if 0
		" Echo translation in the cmdline
		nmap <silent> <Leader>tt <Plug>Translate
		vmap <silent> <Leader>tt <Plug>TranslateV
		" Display translation in a window
		nmap <silent> <Leader>tw <Plug>TranslateW
		vmap <silent> <Leader>tw <Plug>TranslateWV
		" Replace the text with translation
		nmap <silent> <Leader>tr <Plug>TranslateR
		vmap <silent> <Leader>tr <Plug>TranslateRV
		let g:translator_window_enable_icon = v:true
	endif
endif



"----------------------------------------------------------------------
" modules
"----------------------------------------------------------------------
" ai complettion
if has_key(s:enabled, 'AI')
    Plug 'github/copilot.vim'
	imap <silent><script><expr> <M-j> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
endif
	
" CoC
if has_key(s:enabled, 'coc')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	IncScript site/bundle/coc.vim
	IncScript site/bundle/cocexplorer.vim

	nnoremap <space>tp :CocCommand explorer<CR>
endif

" vim-lsp more configuration done
if has_key(s:enabled, 'lsp')
	" lsp 核心插件
	Plug 'prabirshrestha/vim-lsp'
	" lsp 核心补全插件
	Plug 'prabirshrestha/asyncomplete.vim'
	" asyncomplete.vim 的补全引擎
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	" provide buffer autocompletion source for asyncomplete.vim
	Plug 'prabirshrestha/asyncomplete-buffer.vim'
	" 基于tags文件提供自动补全功能
	Plug 'prabirshrestha/asyncomplete-tags.vim'
	" 内置lsp补全配置 比如clangd等
	Plug 'mattn/vim-lsp-settings'
	" Plug 'jsit/asyncomplete-user.vim'
	Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
	IncScript site/bundle/lsp.vim
endif

" vimspector  TODO Test how to using it
if has_key(s:enabled, 'vimspector')
	" A multi language graphical debugger for Vim
	Plug 'puremourning/vimspector'
	IncScript site/bundle/vimspector.vim
endif

" NeoDebug 目前应该不会用
if has_key(s:enabled, 'neodebug')
	" vim plugin for interface to gdb from vim
	Plug 'skywind3000/NeoDebug'
	IncScript site/bundle/neodebug.vim
endif

" deoplete 补全插件 先尝试asynccomplete再说
if has_key(s:enabled, 'deoplete')
	if has('nvim')
		Plug 'Shougo/deoplete.nvim'
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	" Plug 'zchee/deoplete-clangx'
	Plug 'zchee/deoplete-jedi'
	IncScript site/bundle/deoplete.vim
endif

" echodoc
if has_key(s:enabled, 'echodoc')
	" print documents in echo area
	" Displays function signatures from completions in the command line
	Plug 'Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
endif

" lightline
if has_key(s:enabled, 'lightline')
	" A light and configurable statusline/tabline plugin for Vim
	Plug 'itchyny/lightline.vim'
	IncScript site/bundle/lightline.vim
endif

" ale  TODO 学习如何使用, 需要增加更多配置
if has_key(s:enabled, 'ale')
	" Check syntax in vim asynchronously and fix files
	Plug 'w0rp/ale'
	IncScript site/bundle/ale.vim
endif

if has_key(s:enabled, 'matchup')
	" lets you highlight navigate and operate on sets of matching text
	Plug 'andymass/vim-matchup'
	" vim-matchup conflicts with matchit, should disable matchit
	let g:loaded_matchit = 1
	IncScript site/bundle/matchup.vim
else
	runtime! macros/matchit.vim
endif

" vimwiki
if has_key(s:enabled, 'vimwiki')
	" 一组链接起来的、有独特语法高亮的文本文件
	Plug 'vimwiki/vimwiki'
	IncScript site/bundle/vimwiki.vim
endif

" airline
if has_key(s:enabled, 'airline')
	"
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	IncScript site/bundle/airline.vim
endif

if has_key(s:enabled, 'vim-doge')
	" Documentation Generator  以后有需要再学习
	" DoGe will generate a proper documentation skeleton based on certain
	" expressions(mainly functions)
	Plug 'kkoomen/vim-doge'
	IncScript site/bundle/doge.vim
endif

if has_key(s:enabled, 'nerdtree')
	"
	Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	"
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	IncScript site/bundle/nerdtree.vim
endif


if has_key(s:enabled, 'defx')
	Plug 'Shougo/defx.nvim'
	Plug 'kristijanhusak/defx-icons'
	Plug 'kristijanhusak/defx-git'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	" defx也有相同的问题
	IncScript site/bundle/defx.vim
endif

if has_key(s:enabled, 'floaterm')
    Plug 'voldikss/vim-floaterm'
	IncScript site/bundle/floaterm.vim
endif

if has_key(s:enabled, 'grammer')
	" 语法检查插件, 用来写英文的时候可以试一试
	" 使用LanguageTool检查语法
	Plug 'rhysd/vim-grammarous'
	noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
	map <space>rr <Plug>(grammarous-open-info-window)
	map <space>rv <Plug>(grammarous-move-to-info-window)
	map <space>rs <Plug>(grammarous-reset)
	map <space>rx <Plug>(grammarous-close-info-window)
	map <space>rm <Plug>(grammarous-remove-error)
	map <space>rd <Plug>(grammarous-disable-rule)
	map <space>rn <Plug>(grammarous-move-to-next-error)
	map <space>rp <Plug>(grammarous-move-to-previous-error)
endif


if has_key(s:enabled, 'neomake')
	"  语法检查和异步编译 语法检查有ale 异步编译以后再尝试
	" you can use it instead of the built-in :make command
	" 但是该插件的核心功能是根据当前文件类型或者项目类型进行语法检查
	Plug 'neomake/neomake'
endif

if has_key(s:enabled, 'vista')
	" Viewer & Finder for LSP symbols and tags
	" 与leaderF的一些功能重复，以后再尝试
	Plug 'liuchengxu/vista.vim'
endif


if has_key(s:enabled, 'editorconfig')
	" editorconfig 是用于跨不同编辑器和IDE为多个开发人员维护一直的编码风格的配
	" 置文件
	" 有时间再研究  TODO
	Plug 'editorconfig/editorconfig-vim'
endif

if has_key(s:enabled, 'neoterm')
	" 编辑中开启 命令行（类似于vscode IDE)
	" TODO 有需要再尝试
	Plug 'kassio/neoterm'
endif

if has_key(s:enabled, 'clap')
	" 模糊查找工具，与LeaderF类似 闲了再尝试吧
	Plug 'liuchengxu/vim-clap'
	IncScript site/bundle/clap.vim
endif


if has_key(s:enabled, 'splitjoin')
	" switching between a single-line statement and a multi-line
	Plug 'AndrewRadev/splitjoin.vim'
endif

if has_key(s:enabled, 'lsp-lcn')
	" 另一个 lsp 好像比vim-lsp强大 以后再试用
	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next' }
	IncScript site/bundle/lcn.vim
endif

if has_key(s:enabled, 'keysound')
	" 打字机的声音
	Plug 'skywind3000/vim-keysound'
	let g:keysound_theme = 'default'
	let g:keysound_enable = 1
endif

if has_key(s:enabled, 'icons')
	" gvim toolbar icons based in silk icon theme
	Plug 'istepura/vim-toolbar-icons-silk'
endif

if has_key(s:enabled, 'tabnine')
	" YoucompleteMe 的一个分支  不好用
	Plug 'codota/tabnine-vim'
	IncScript site/bundle/tabnine.vim
endif


if has_key(s:enabled, 'colors')
    Plug 'joshdick/onedark.vim'
	Plug 'morhetz/gruvbox'
	Plug 'sainnhe/gruvbox-material'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'sainnhe/sonokai'
	Plug 'arcticicestudio/nord-vim'
	" Plug 'arzg/vim-colors-xcode', {'on':[]}
    Plug 'wuelnerdotexe/vim-enfocado', {'on':[]}
	Plug 'kaicataldo/material.vim'
	" Plug 'cocopon/iceberg.vim', {'on':[]}
	" Plug 'mcchrish/zenbones.nvim', {'on':[]}
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'flazz/vim-colorschemes', {'on':[]}
endif


if has_key(s:enabled, 'which_key')
	" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
	Plug 'liuchengxu/vim-which-key'
endif

if has_key(s:enabled, 'supertab')
	" 一个古老的上下文补全插件
	Plug 'ervandew/supertab'
	IncScript site/bundle/supertab.vim
endif


if has_key(s:enabled, 'blamer')
	" A git blame plugin for neovim
	" TODO 以后再尝试
	Plug 'APZelos/blamer.nvim'
endif


if has_key(s:enabled, 'cursorword')
	"  在当前光标下的单词下面划线
	Plug 'itchyny/vim-cursorword'
	let g:cursorword_delay = 100
endif

if has_key(s:enabled, 'anyjump')
	" 跳转插件 有时间再试用
	Plug 'pechorin/any-jump.vim'
endif

if has_key(s:enabled, 'snippets')
	" Snippet engines which allow the user to insert snippets
	Plug 'SirVer/ultisnips'
	" lots of different language sinppets
	Plug 'honza/vim-snippets'

	IncScript site/bundle/ultisnips.vim
endif


"----------------------------------------------------------------------
" packages end
"----------------------------------------------------------------------
if exists('g:bundle_post')
	if type(g:bundle_post) == type('')
		exec g:bundle_post
	elseif type(g:bundle_post) == type([])
		exec join(g:bundle_post, "\n")
	endif
endif

call plug#end()

if has_key(s:enabled, 'which_key')
	" which_key中的设置需要在 plug#end后面，否则会报 which_key#register找不到的错
	" 误
	IncScript site/bundle/which_key.vim
endif

"----------------------------------------------------------------------
" move s:home to the top of rtp
"----------------------------------------------------------------------
if get(g:, 'reorder_rtp', 0)
	let rtps = split(&rtp, ',')
	let rtps = [s:home] + rtps
	let &rtp = ''
	for n in rtps | exec 'set rtp+=' . fnameescape(n) | endfor
endif

