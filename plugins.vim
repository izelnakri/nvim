call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do' : './install --bin' }
Plug 'junegunn/fzf.vim' " TODO: customize this further Lead-P selection should prefill right side, advanced ripgrep, search/replace
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Colors
Plug 'sonph/onehalf'

" Handyness
Plug 'w0rp/ale'                                               " Linters
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'                                 " GIT gutter
Plug 'tpope/vim-rhubarb'                                      " :Gbrowse
Plug 'tpope/vim-eunuch'                                       " UNIX commands like :SudoWrite, :Rename, :Delete
Plug 'chrisbra/NrrwRgn'                                       " TODO: Narrow Region Plugin
Plug 'terryma/vim-multiple-cursors'                           " TODO:
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " TODO: AutoComplete framework Languages Plug 'python-mode/python-mode', { 'branch': 'master' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'HerringtonDarkholme/yats' " Typescript syntax
Plug 'othree/es.next.syntax.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim' " TODO
Plug 'cakebaker/scss-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'
" maybe add minimap, ultisnips, customize fzf for bat and ripgrep
" customize git plugin to show the recent branch

call plug#end()

" Plugin configuration 
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode=2
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:deoplete#enable_at_startup = 1

" NerdTree open directory with tree:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim quits when NerdTree is the only thing left:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" FZF configurations:
let g:fzf_layout = { 'down': '~30%', 'window': '--reverse'  }
let g:fzf_files_options = ['--reverse']
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
\ }

" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

" https://github.com/tpope/vim-surround
" " maybe syntastic, vim-test, supertab?, check youtube test traversal
