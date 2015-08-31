set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git plugin
Plugin 'tpope/vim-fugitive'

" Colors
Plugin 'Slava/vim-colors-tomorrow'
Plugin 'flazz/vim-colorschemes'
Plugin 'lsdr/monokai'
Plugin 'tomasr/molokai'
Plugin 'whatyouhide/vim-gotham'
Plugin 'morhetz/gruvbox'
Plugin 'rhysd/try-colorscheme.vim'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'atweiden/vim-colors-behelit'
Plugin 'mhumeSF/one-dark.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" UI
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'severin-lemaignan/vim-minimap'

" Movement
Plugin 'Lokaltog/vim-easymotion'

" Editin
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'

" Syntactic helpers
Plugin 'scrooloose/syntastic'

" Tools
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'Vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'

" Language specific
Plugin 'kspi/cargo-relative'
Plugin 'wting/rust.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'jimenezrick/vimerl'
Plugin 'LnL7/vim-nix'

"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'chriskempson/base16-vim'
"Plugin 'zeis/vim-kolor'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'KevinGoodsell/vim-csexact'
"Plugin 'idris-hackers/idris-vim'
"Plugin 'jpalardy/vim-slime'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'vim-scripts/Delphi-7-2010'
"Plugin 'bling/vim-bufferline'
"Plugin 'kurkale6ka/vim-swap'
"Plugin 'noahfrederick/vim-noctu'
"Plugin 'farseer90718/vim-taskwarrior'
"Plugin 'Yggdroot/indentLine'
"Plugin 'junegunn/limelight.vim'
"Plugin 'junegunn/goyo.vim'
"Plugin 'ajacksified/vim-colors-solarized-brown'
"Plugin 'https://github.com/orthecreedence/void.vim.git'
"Plugin 'itchyny/lightline.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete

set title
set enc=utf-8
set fileencoding=utf-8

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set relativenumber
set number
set mouse=a
set noswapfile
set laststatus=2
"set t_Co=256
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
syntax enable
syntax on
match ErrorMsg '\s\+$'

"let g:gruvbox_termcolors=16
"let g:hybrid_use_Xresources = 1
colorscheme materialtheme_new
highlight Normal ctermbg=NONE

let g:airline_powerline_fonts=1
let g:airline_theme='lucius'
" タブラインにもairlineを適用
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
"（タブが一個の場合）バッファのリストをタブラインに表示する機能をオフ
let g:airline#extensions#tabline#show_buffers = 0
" 0でそのタブで開いてるウィンドウ数、1で左のタブから連番
let g:airline#extensions#tabline#tab_nr_type = 1
" タブに表示する名前（fnamemodifyの第二引数）
let g:airline#extensions#tabline#fnamemod = ':t'

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

let mapleader=","
" Delete trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

let g:calendar_google_calendar = 1
let g:vimwiki_dir_link = 'index'
let g:vimwiki_use_calendar = 1
let g:vimwiki_list = [{
  \ 'path': '$HOME/vimwiki',
  \ 'template_path': '$HOME/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]
autocmd FileType calendar nmap <buffer> <CR> :<C-u>call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()<CR>

set hidden
let g:racer_cmd = "/home/rootnode/programs/src/racer/target/debug/racer"
let $RUST_SRC_PATH="/home/rootnode/programs/src/rust/src"
let g:racer_experimental_completer = 1
highlight Pmenu ctermbg=160 ctermfg=230 gui=bold
set grepprg=grep\ -nH\ $*

let g:haddock_browser = "chromium-dev"

map <C-n> :NERDTreeToggle<CR>
map <C-S-1> 1gt
map <C-S-2> 2gt
map <C-S-3> 3gt
map <C-S-4> 4gt
map <C-S-5> 5gt
map <C-S-6> 6gt
map <C-S-7> 7gt
map <C-S-8> 8gt
map <C-S-9> 9gt
" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

if &term =~ '^xterm'
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

au Bufenter *.hs compiler ghc
au Bufenter,BufNewFile,BufRead *.lpr,*.LPR set ft=delphi

let g:syntastic_cpp_compiler = 'clang++'

"autocmd User GoyoEnter Limelight
"autocmd User GoyoLeave Limelight!

:map <f9> :make
:set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ .
:set nofoldenable
