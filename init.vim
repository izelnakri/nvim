" Important
let mapleader = "\<Space>"

" Includes
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/bindings.vim

" Settings
set nocompatible
set ruler
set number
set showcmd
set cursorline

syntax enable 
filetype on 

" General
set path+=**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set backspace=indent,eol,start
set backupdir=~/.vim/backup

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

" Plugin configuration
let g:pymode_lint = 0
let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode=2

" FZF
let g:fzf_layout = { 'down': '~20%' }
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Colorschemes
" gruvbox, inkpot, zenburn, hybrid_material
" https://github.com/jacoborus/tender.vim
" https://github.com/NLKNguyen/papercolor-theme
" let g:lightline.colorscheme='onehalfdark'

set background=light
colorscheme PaperColor

command! MakeTags !ctags -R .
