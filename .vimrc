set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'
Plugin 'xuhdev/SingleCompile'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set autoindent
set fileformat=unix
set encoding=utf-8

let s:tabwidth=4
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth

" au Filetype * set expandtab
" au Filetype * let let &l:softtabstop = s:tabwidth
" Uncomment above for soft, below for hard tabs
" au Filetype * let &l:softtabstop = 0
" au Filetype * set noexpandtab

syntax on
set relativenumber
set number
set noswapfile
set mouse=a

let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme monokai

set ttimeoutlen=50
set laststatus=2
let g:airline_theme = 'powerlineish'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

imap <F1> <Esc>:SCCompileRun<cr>
nmap <F1>      :SCCompileRun<cr>
imap <F2> <Esc>:SCCompileRun -std=c++11 -O2 -o $(FILE_TITLE)$<cr>
nmap <F2>      :SCCompileRun -std=c++11 -O2 -o $(FILE_TITLE)$<cr>
imap <F3> <Esc>:SCCompileRun -std=c++11 -Ofast -march=native -o $(FILE_TITLE)$<cr>
nmap <F3>      :SCCompileRun -std=c++11 -Ofast -march=native -o $(FILE_TITLE)$<cr>
