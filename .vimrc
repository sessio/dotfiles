syntax enable
syntax on

set expandtab
set shiftwidth=2
set softtabstop=2

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

nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>

" open new buffers in tabs as default
set switchbuf=usetab,newtab

set pastetoggle=<F2>

" Vundle conf
set nocompatible              " be iMproved, required
filetype off                  " required for duration of vundle conf
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
Plugin 'pangloss/vim-javascript'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

autocmd filetype make set noexpandtab " makefiles need real tabs

" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set laststatus=2

" Solarized theme
set background=dark
colorscheme solarized

" indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1 " <Leader>ig toggles
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" set vim to watch vim config file for changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
