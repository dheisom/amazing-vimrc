" Root Author: Filipe Deschamps (@filipedeschamps)
" Root Source: https://github.com/filipedeschamps/dotfiles
"
" Base Author: Gabriel (@foxx3r)
" Base Source: https://github.com/foxx3r/amazing-vimrc
"
" Fork: Dheisom (@dheisom)
" Fork Source: https://github.com/dheisom/amazing-vimrc

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
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'Raimondi/delimitMate'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rking/ag.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'kyoz/purify', { 'rtp': 'vim' }
    Plug 'prabirshrestha/async.vim'
    Plug 'mattn/emmet-vim'
call plug#end()

" Emmet.vim is the same as VSCode (Visual Studio Code) it helps you
"  write html codes faster

" Enable syntax highlighting
syntax on

" SEARCH
" Vim will start searching as you type
set incsearch

" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" vim-airline config
let g:airline#entensions#tabline#enabled = 1
let g:airline#entensions#tabline#left_sep = ' '
let g:airline#entensions#tabline#left_alt_sep = '|'
let g:airline#entensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

" Make Ag search from your project root
let g:ag_working_path_mode="r"

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
colorscheme purify

" FONT
set guifont=Monaco\ for\ Powerline:h12s

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

" FILE NUMBERS
" Enable relative and absolute file numbers
set number relativenumber

" WRAP
" Stop wrapping long lines
"set nowrap

" Automatically reload buffers when file changes
set autoread

" PLUGINS CONFIGURATIONS

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set nocursorcolumn
set nocursorline
set norelativenumber
set lazyredraw
set mouse=
syntax sync minlines=256
