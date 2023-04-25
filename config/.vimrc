set backspace=indent,eol,start

" Normally we use vim-extensions. If you want true vi-compatibility
set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" fix UP Down Left Right keys Inserting A B C D character

" Configuration file for vim
set modelines=0   " CVE-2007-2438

" set mapleader
let mapleader = ','

" remove change the following statements
" set backspace=2   " more powerful backspacing
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
syntax on

set number

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 1 tab == 4 space
" set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" set expandtab

set smartindent
set autoindent

set ruler
set showcmd
set showmode

set scrolloff=7

set hlsearch

set showmatch
set matchtime=2

"set foldmethod
"set fdm=syntax
"enable mouse support
"set mouse=a
"ignore case
"set ignorecase
"" visual tab
set list
set lcs=tab:\>\ ,nbsp:%,trail:-
"set lcs=tab:\▸\ ,nbsp:%,trail:-
"set cursorcolumn " 高亮光标列
"set cursorline " 高亮光标行
"set foldmethod=indent "set default foldmethod

" close preview windows default
set completeopt-=preview
set completeopt=longest,menu

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plugin 'vim-scripts/nginx.vim'
" Plugin 'davidhalter/jedi-vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

Plugin 'vim-scripts/taglist.vim'
map <C-m> :TagbarToggle<CR>

" golang support
Plugin 'fatih/vim-go'

Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
map <C-l> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plugin 'mileszs/ack.vim'
nnoremap <Leader>a :Ack<Space>
" let g:ack_default_options = ' -s -H --color --nogroup --column  --smart-case --follow'

Plugin 'ctrlpvim/ctrlp.vim'
map <C-p> :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  'tmp\|vendor\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_height=15

" A simple function navigator for ctrlp.vim
Plugin 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<CR>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']


Plugin 'vim-scripts/mru.vim'
map <C-u> :MRU<CR>
" 重用当前窗口
" let MRU_Use_Current_Window = 1
let MRU_Window_Height = 15
let MRU_Exclude_Files = 'private'

Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = '<C-o>'

" git plugin
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"beautiful status line
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols='unicode'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" tmux
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup=1

Plugin 'rakr/vim-one'

Plugin 'alegen/DeleteTrailingWhitespace.vim'
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'


call vundle#end()

colorscheme molokai
" set background=light
" colorscheme solarized


" let g:ycm_rust_src_path="/Users/luolibin/local/rustsource/rust"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>e <Plug>(go-coverage)
" set go-def map  
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" set go-doc map
au FileType go nmap <Leader>gs <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" indent guides
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
set background=dark

" python code skip
"let g:jedi#goto_command = "<leader>pd"
"let g:jedi#goto_assignments_command = "<leader>pg"
"let g:jedi#documentation_command = "pk"
"let g:jedi#usages_command = "<leader>pn"
"let g:jedi#completions_command = "<C-f>"

" Configuration for php
" set foldmethod=marker
