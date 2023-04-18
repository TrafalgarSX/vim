"----------------------------------------------------------------------
" functions
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:windows = has('win32') || has('win64') || has('win95') || has('win16')
let s:gui = has('gui_running')

" echo s:path('tools/win32')
if has('nvim')
	if exists('g:GuiLoaded')
		if g:GuiLoaded != 0
			let s:gui = 1
		endif
	elseif exists('*nvim_list_uis') && len(nvim_list_uis()) > 0
		let uis = nvim_list_uis()[0]
		let s:gui = get(uis, 'ext_termcolors', 0)? 0 : 1
	elseif exists("+termguicolors") && (&termguicolors) != 0
		let s:gui = 1
	endif
endif

let g:asc#has_gui = s:gui


"----------------------------------------------------------------------
" netrw
"----------------------------------------------------------------------
let g:netrw_liststyle = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\.swp\($\|\t\),\.py[co]\($\|\t\),\.o\($\|\t\),\.bak\($\|\t\),\(^\|\s\s\)\zs\.\S\+'
let g:netrw_sort_sequence = '[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$'
let g:netrw_preview = 0
"let g:netrw_special_syntax = 1
let g:netrw_sort_options = 'i'

if isdirectory(expand('~/.vim'))
	let g:netrw_home = expand('~/.vim')
endif

"let g:netrw_timefmt = "%Y-%m-%d %H:%M:%S"

"let g:netrw_banner=0
"let g:netrw_browse_split=4   " open in prior window
"let g:netrw_altv=1           " open splits to the right
"let g:netrw_liststyle=3      " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()

let s:ignore = ['.obj', '.so', '.a', '~', '.tmp', '.egg', '.class', '.jar']
let s:ignore += ['.tar.gz', '.zip', '.7z', '.bz2', '.rar', '.jpg', '.png']
let s:ignore += ['.chm', '.docx', '.xlsx', '.pptx', '.pdf', '.dll', '.pyd']
let s:ignore += ['.xls', '.mobi', '.mp4', '.mp3']

for s:extname in s:ignore
	let s:pattern = escape(s:extname, '.~') . '\($\|\t\),'
	" let g:netrw_list_hide = s:pattern . g:netrw_list_hide
endfor

let s:pattern = '#.\{-\}#\($\|\t\),'
if has('win32') || has('win16') || has('win95') || has('win64')
	let s:pattern .= '\$.\{-\}\($\|\t\),'
endif

" let g:netrw_list_hide = s:pattern . g:netrw_list_hide

" fixed netrw underline bug in vim 7.3 and below
if v:version < 704
	"set nocursorline
	"au FileType netrw hi CursorLine gui=underline
	"au FileType netrw au BufEnter <buffer> hi CursorLine gui=underline
	"au FileType netrw au BufLeave <buffer> hi clear CursorLine
	autocmd BufEnter * if &buftype == '' | :set nocursorline | endif
endif

let g:ft_man_open_mode = 'vert'


"----------------------------------------------------------------------
"- Tagbar
"----------------------------------------------------------------------
" let g:tagbar_left = 1
" let g:tagbar_vertical = 0
" let g:tagbar_width = 28
" let g:tagbar_sort = 0
" let g:tagbar_compact = 1


"----------------------------------------------------------------------
"- TagList
"----------------------------------------------------------------------
" let Tlist_Show_One_File = 1
" let Tlist_Use_Right_Window = 1
" let Tlist_WinWidth = 28
" let Tlist_Inc_Winwidth = 0
" let Tlist_Enable_Fold_Column = 0
" let Tlist_Show_Menu = 0
" let Tlist_GainFocus_On_ToggleOpen = 1


"----------------------------------------------------------------------
" FuzzyFinder
"----------------------------------------------------------------------
let g:fuf_modesDisable = ['mrucmd', ]
let g:fuf_keyOpenSplit = '<C-x>'
let g:fuf_keyOpenVsplit = '<C-v>'
let g:fuf_keyOpenTabpage = '<C-t>'
let g:fuf_dataDir = '~/.vim/fuf-data'
let g:fuf_mrufile_maxItem = 500
let g:fuf_mrufile_maxItemDir = 100
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'


"----------------------------------------------------------------------
"- CtrlP
"----------------------------------------------------------------------
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
" let g:ctrlp_working_path = 0



"----------------------------------------------------------------------
" vim-notes
"----------------------------------------------------------------------
let g:notes_directories = ['~/.vim/notes']


"----------------------------------------------------------------------
" Signify
"----------------------------------------------------------------------
let g:signify_vcs_list = ['git', 'svn']
let g:signify_difftool = 'diff'
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_as_gitgutter           = 1

let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}


"----------------------------------------------------------------------
"- Misc
"----------------------------------------------------------------------
let g:calendar_navi = 'top'
let g:EchoFuncTrimSize = 1
let g:EchoFuncBallonOnly = 1
let g:startify_disable_at_vimenter = 0
let g:startify_session_dir = '~/.vim/session'
let g:vim_json_conceal = 0


"----------------------------------------------------------------------
" asyncrun / vimmake
"----------------------------------------------------------------------
let g:asyncrun_open = 15
let g:asyncrun_timer = 200
let s:python = executable('python3')? 'python3' : 'python'
let s:script = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:launch = s:script . '/lib/launch.py'

if filereadable(s:launch)
	let s:hz = g:asyncrun_timer * 10 * 80 / 100
	let g:asyncrun_shell_bak = s:python
	let g:asyncrun_shellflag = s:launch
	let $VIM_LAUNCH_HZ = ''. s:hz
endif

if s:windows != 0
	let g:asyncrun_encs = 'gbk'
endif

if executable('rg')
	let g:vimmake_grep_mode = 'rg'
endif


"----------------------------------------------------------------------
" asynctasks
"----------------------------------------------------------------------
let s:config = (s:windows)? 'tasks.win32.ini' : 'tasks.linux.ini'
let g:asynctasks_extra_config = [s:home . '/'. s:config]
let g:asynctasks_term_pos = (s:windows && s:gui)? 'external' : 'TAB'
let g:asynctasks_template = 0
let g:asynctasks_confirm = 0
let g:asynctasks_template = s:home . '/tools/conf/template.ini'
let g:asynctasks_environ = get(g:, 'asynctasks_environ', {})
" let g:asynctasks_rtp_config = 'etc/tasks.ini'


"----------------------------------------------------------------------
" text
"----------------------------------------------------------------------
let g:vim_dict_config = {
			\ "text" : 'text',
			\ "markdown" : 'text',
			\ "html": 'html,javascript,css,css3',
			\ }


"----------------------------------------------------------------------
" delimitmate
"----------------------------------------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_offByDefault = 0


"----------------------------------------------------------------------
" terminal help
"----------------------------------------------------------------------
let g:terminal_close = 1
let g:terminal_list = 0
let g:terminal_fixheight =1


"----------------------------------------------------------------------
" indentLine
"----------------------------------------------------------------------
" let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#e1ffe1'  " '#96aaa0'
" let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1


"----------------------------------------------------------------------
" gutentags
"----------------------------------------------------------------------
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = 'C:\Users\guoya\scoop\apps\global\6.6.9\share\gtags\gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 普通项目在项目根目录创建一个 .root文件即可

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启ctags 和 gtags的支持
let g:gutentags_modules = []
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
if exists('g:gutentags_cache_dir') == 0
	let g:gutentags_cache_dir = expand('~/.cache/tags')
endif

if !isdirectory(g:gutentags_cache_dir)
	call mkdir(g:gutentags_cache_dir, 'p')
endif

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
if has('win32') || has('win16') || has('win64') || has('win95')
	let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1

let g:gutentags_plus_switch = 1
" 通过上面的配置，可以在后台自动打理 ctags 和 gtags 数据库，
" 检测文件改动，并更新到 ~/.cache/tags 目录中，避免污染你的项目目录。

" 这些映射是quickmenu里的函数， 会让你输入东西进行查找(本文件中你输入的符号,大
" 概，没测试过)
" gutentags 本身有一系列的快捷键映射,查找本文件下所有相关的
" Definition
nnoremap <silent><space>mg :call menu#Escope("g")<cr>  
" Symbol
nnoremap <silent><space>ms :call menu#Escope("s")<cr>
" Called by
nnoremap <silent><space>md :call menu#Escope("d")<cr>
" Function Calling
nnoremap <silent><space>mc :call menu#Escope("c")<cr>
" Text string 
nnoremap <silent><space>mt :call menu#Escope("t")<cr>
" Egrep pattern
nnoremap <silent><space>me :call menu#Escope("e")<cr>
" Find file
nnoremap <silent><space>mf :call menu#Escope("f")<cr>
" Files including
nnoremap <silent><space>mi :call menu#Escope("i")<cr>




"----------------------------------------------------------------------
" styles
"----------------------------------------------------------------------
let g:jellybeans_use_term_italics = 0
let g:jellybeans_use_gui_italics = 0

"----------------------------------------------------------------------
" colorscheme
"----------------------------------------------------------------------
let g:enfocado_style = "neon"
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

"----------------------------------------------------------------------
" rainbow
"----------------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['#ffd52e', '#a05dff', '#ff0f33', 'seagreen3', '#c8acff', '#0167ff'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\		'nerdtree': 0,
	\	}
	\}
" NERDTree與Rainbow會衝突，產生多餘的括號


"----------------------------------------------------------------------
" defx 
"----------------------------------------------------------------------
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
      \ 'resume': 1,
	  \ 'root_marker': '≡',
	  \ 'ignored_files':
	  \     '.mypy_cache,.pytest_cache,.hg,.svn,.stversions,.obj,.so'
	  \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	  \   . ',.a,.tmp,.class,.jar,.zip,.7z,.rar,.jpg,.png,.chm,.docx,.xlsx'
	  \   . '.pdf,.dll,.pptx,.mp4,.mp3,.pyd',
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



""----------------------------------------------------------------------
" defx-icons 
"----------------------------------------------------------------------
" may cause performance issue
let g:defx_icons_enable_syntax_highlight = 1



"----------------------------------------------------------------------
" defx-git 
"----------------------------------------------------------------------
"  determines if ignored files should be marked with indicator.
" call defx#custom#column('git', 'show_ignored', 0)
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
