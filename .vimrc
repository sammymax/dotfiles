set nocompatible              " required
filetype off                  " required

if has("mouse_urxvt")
	set ttymouse=urxvt
end

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'editorconfig/editorconfig-vim'
Plugin 'gmarik/Vundle.vim'
" jsx highlighting + its js highlighting dependency
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" use jsx plugin on .js files too
let g:jsx_ext_required = 0

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

noremap j gj
noremap k gk

let mapleader = "\<Space>"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l

let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme monokai
set incsearch
set hlsearch
hi Search ctermbg=yellow
hi Search ctermfg=black
hi Search guibg=yellow
hi Search guifg=black
hi IncSearch ctermbg=magenta
hi IncSearch guibg=magenta

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
