set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'lukerandall/haskellmode-vim'
Plugin 'lsdr/monokai'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/CSApprox'
Plugin 'whatyouhide/vim-gotham'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set mouse=a
set noswapfile
set laststatus=2
set t_Co=256
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
syntax enable
syntax on
colorscheme bluegreen
let g:bluegreen_termcolors=256
highlight Normal ctermbg=NONE
match ErrorMsg '\s\+$'
colorscheme bluegreen

let g:airline_powerline_fonts=1
let g:airline_theme='raven'


let mapleader=","
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

set hidden
let g:racer_cmd = "/home/wollwage/programs/src/racer/target/racer"
let $RUST_SRC_PATH="/home/wollwage/programs/src/rust/src"

let g:haddock_browser = "chromium-dev"

map <C-n> :NERDTreeToggle<CR>

colorscheme bluegreen