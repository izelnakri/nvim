" Important
let mapleader = "\<Space>"

" Includes
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/bindings.vim

set t_Co=256
set guifont=Meslo\ LG\ L\ DZ:h11
" alternatives: Consolas, Monaco

" Better line-height
set linespace=7
set guioptions-=r
set guioptions-=L

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
set backupdir=~/.config/nvim/backup

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

command! MakeTags !ctags -R .
set background=dark
colorscheme birds-of-paradise

let s:color_blue=' ctermfg=024 ctermbg=NONE cterm=NONE guifg=#6C99BB guibg=NONE'
let s:color_red=' ctermfg=124 ctermbg=NONE cterm=NONE guifg=#EF5D32 guibg=NONE'
let s:color_orange= ' ctermfg=208 ctermbg=NONE cterm=NONE guifg=#EFAC32 guibg=NONE'

" hi def link jsObjectProp Identifier
exec 'hi Boolean' . s:color_blue
exec 'hi Character' . s:color_blue
exec 'hi Constant' . s:color_blue
exec 'hi Float' . s:color_blue
exec 'hi Number' . s:color_blue
exec 'hi Directory' . s:color_blue

exec 'hi Conditional' . s:color_red
exec 'hi Operator' . s:color_red
exec 'hi Statement' . s:color_red
exec 'hi Identifier' . s:color_red
exec 'hi PreProc' . s:color_red
exec 'hi Keyword' . s:color_red

exec 'hi Function' . s:color_orange
exec 'hi Type' . s:color_orange
exec 'hi Tag' . s:color_orange
exec 'hi rubyFunction' . s:color_orange
exec 'hi cssFunctionName' . s:color_orange
exec 'hi cssPseudoClassId' . s:color_orange
exec 'hi cssClassName' . s:color_orange
