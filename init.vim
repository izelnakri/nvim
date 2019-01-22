" Important
let mapleader = "\<Space>"

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'handlebars': ['ember-template-lint']
\}
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save' 
" Includes
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/bindings.vim

set t_Co=256

" Better line-height
set guioptions-=r
set guioptions-=L

" Settings
set nocompatible
set hidden
set ruler
set number
set showcmd
set cursorline

syntax on
filetype off 

" General
set path+=**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set backspace=indent,eol,start
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Set encoding
set encoding=utf-8
set t_Co=256o

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Colorschemes
" gruvbox, inkpot, zenburn, hybrid_material
" https://github.com/jacoborus/tender.vim
" https://github.com/NLKNguyen/papercolor-theme

command! MakeTags !ctags -R .

set background=dark

source ~/.config/nvim/colors/default.vim
source ~/.config/nvim/colors/javascript.vim
