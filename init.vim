let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)
exec 'set rtp+=~/.vim'

set pythonthreedll=python310.dll
set luadll=C:\Users\guoya\scoop\apps\lua\5.4.2\lua54.dll
" set luadll=lua54.dll
"tabnine依赖 youcompleteme
let g:bundle_group = ['simple', 'basic', 'high', 'inter', 'opt', 'which_key']
let g:bundle_group += ['coc', 'ale', 'blamer', 'snippets', 'vimspector']
let g:bundle_group += ['matchup', 'airline', 'grammer', 'colors', 'cursorword']
let g:bundle_group += ['AI', 'defx', 'floaterm']

" let g:bundle_group += ['time']

" let g:bundle_group = ['which_key' ]

" 'splitjoin' 以后如果需要多次切换(单行  多行)再说
" 'lightline', 与airline重复
" vim-doge 文档生成， 以后有机会再学习
" inter模块 目前包含gist，一些函数库和高亮同一单词的几个插件
" opt模块，目前包含
" 'coc'
" 'icons' gvim 上面那一排， 用不上

" nerdtree
" g:bundle_group +=['coc', 'high', 'ale', 'vim-doge', 'icons', 'blamer', 'snippets']
so ~/.vim/vim/bundle.vim

IncScript init/viminit.vim
" 一些tab相关的工具函数
IncScript init/config.vim
" 一些工具函数  grepCode tagGeneration
IncScript init/vimmake.vim
IncScript init/ignores.vim
" 一些工具函数，有些被映射了快捷键
IncScript init/tools.vim
" 快捷键 需要常看
IncScript init/keymaps.vim
" 插件的设置
IncScript init/plugins.vim
IncScript init/status.vim
" gui的一些主题，字体设置
IncScript init/gui.vim
" 作用复杂, 待详细了解
IncScript init/unix.vim
" 一些snippet 用处不大, 可有可无
IncScript init/misc.vim

IncScript init/menu.vim



let name = expand('~/.vim/local.vim')

if filereadable(name)
  exec 'source '. fnameescape(name)
endif

" let g:bundle_group = ['simple', 'basic', 'inter', 'opt', 'ale', 'echodoc']

