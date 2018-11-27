call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do' : './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'

" Colors
" Plug 'flazz/vim-colorschemes'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf'

" Handyness
Plug 'w0rp/ale'                                               " Linters
Plug 'airblade/vim-gitgutter'                                 " GIT gutter
Plug 'tpope/vim-eunuch'                                       " UNIX commands
Plug 'chrisbra/NrrwRgn'                                       " Narrow Region Plugin
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " AutoComplete framework
Plug 'scrooloose/nerdtree' 

" Languages
Plug 'python-mode/python-mode', { 'branch': 'master' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5
" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

" https://github.com/tpope/vim-surround
