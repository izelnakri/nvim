" Important
let mapleader = "\<Space>"

" DO this: https://www.youtube.com/watch?v=aHm36-na4-4  smart .swp navigation
" Also add the plugin to make , to a bulleted list
" Highlight sum, avg, min, max shown down for numbers in highlight, also adds to yank mode


autocmd FileType html.handlebars let g:ale_javascript_prettier_options = '--parser=glimmer'

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint', 'tsserver'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': [''],
\   'html.handlebars': ['ember-template-lint'],
\ }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\  'typescript': ['prettier', 'eslint'],
\   'html': [''],
\  'html.handlebars': ['prettier'],
\  'elixir': ['mix format'],
\  'rust': ['cargo fmt']
\ }

let g:sneak#label = 1

let g:ale_sign_error = '🍄'
let g:ale_sign_warning = '🙀'

" let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save'
let g:airline_highlighting_cache = 0

" Includes
" set shell=sh
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/bindings.vim
set t_Co=256

" Better line-height
set guioptions-=r
set guioptions-=L

" Settings
set undofile
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
set undodir^=~/.vim/undo//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto

" Set encoding
set encoding=utf-8
set t_Co=256o


" Whitespace stuff
set nowrap
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
set expandtab ts=2 sts=2 sw=2 ai
set list
set listchars=tab:\ \ ,trail:·
" filetype plugin indent on

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase
set inccommand=nosplit

" Colorschemes
" gruvbox, inkpot, zenburn, hybrid_material
" https://github.com/jacoborus/tender.vim
" https://github.com/NLKNguyen/papercolor-theme

command! MakeTags !ctags -R .

" Code fold saving on sessions
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

set background=dark

source ~/.config/nvim/colors/default.vim
source ~/.config/nvim/colors/javascript.vim
source ~/.config/nvim/colors/typescript.vim
source ~/.config/nvim/snippets.vim
set shell=sh
