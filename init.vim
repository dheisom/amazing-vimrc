" Root Author: Filipe Deschamps (@filipedeschamps)
" Root Source: https://github.com/filipedeschamps/dotfiles
"
" Base Author: Gabriel (@foxx3r)
" Base Source: https://github.com/foxx3r/amazing-vimrc
"
" Fork: Dheison (@dheison0)
" Fork Source: https://github.com/dheison0/amazing-vimrc

" LEADER KEY
let mapleader=","

" COMPATIBILITY
" Set 'nocompatible' to avoid unexpected things that your distro might have
set nocompatible
set t_ut=

" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure vim-plug
call plug#begin('~/.vim/bundle')
    Plug 'vim-scripts/AutoComplPop'
    Plug 'Raimondi/delimitMate'
    Plug 'sheerun/vim-polyglot'
    Plug 'prabirshrestha/async.vim'
    Plug 'AhmedAbdulrahman/vim-aylin'
    Plug 'itchyny/lightline.vim'
call plug#end()


" Enable syntax highlighting
syntax on

" SEARCH
" Vim will start searching as you type
set incsearch

" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4

" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden

" Auto jump to the last position on reopening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Enable omnifunc
set omnifunc=syntaxcomplete#Complete

" COLOR SCHEME
set background=dark
colorscheme aylin
if (has("termguicolors"))
  set termguicolors
endif

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu
set cursorline

" Complete files like a shell
set wildmode=list:longest

" Speedup
set ttyfast

" Enable line number
set number

" WRAP
" Stop wrapping long lines
"set nowrap

" Automatically reload buffers when file changes
set autoread

" PLUGINS CONFIGURATIONS

" LightLine
let g:lightline = {
      \ 'colorscheme': 'aylin',
      \ }

" Other configs
set nocursorcolumn
" set nocursorline
set norelativenumber
set lazyredraw
syntax sync minlines=256

