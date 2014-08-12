syntax enable
syntax on

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set nobackup
set noswapfile

set hlsearch
set ignorecase
set vb

" single char delete to null register
noremap x "_x

let mapleader=","

" map <leader>-<n> to tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

" open new buffers in tabs as default
set switchbuf=usetab,newtab

autocmd filetype html,make set noexpandtab

set pastetoggle=<F2>

set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle conf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

Plugin 'Shutnik/jshint2.vim'

" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set laststatus=2

" Solarized theme
set background=dark
colorscheme solarized

" set vim to watch vim config file for changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
