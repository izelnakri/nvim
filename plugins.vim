call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do' : './install --bin' }
Plug 'junegunn/fzf.vim' " TODO: customize this further Lead-P selection should prefill right side, advanced ripgrep, search/replace
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'izelnakri/nerdtree-git-plugin'
Plug 'brooth/far.vim'

" Colors
" Plug 'sonph/onehalf'

" Handyness
Plug 'w0rp/ale'                                               " Linters
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'                                 " GIT gutter
Plug 'tpope/vim-rhubarb'                                      " :Gbrowse
Plug 'tpope/vim-eunuch'                                       " UNIX commands like :SudoWrite, :Rename, :Delete
Plug 'tpope/vim-surround'                                     " cs$, cst$, ds$, ysiw$, Visual MODE: S$ 
Plug 'terryma/vim-multiple-cursors'                           " NOTE: <C-n> is the magic
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim' 
Plug 'cakebaker/scss-syntax.vim'
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats' " Typescript syntax
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'
Plug 'ervandew/supertab'
Plug 'timakro/vim-searchant'
Plug 'janko-m/vim-test'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" Plugin configuration 
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode=2
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 0
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "208",
    \ "Staged"    : "029",
    \ "Untracked" : "035", 
    \ "Dirty"     : "208",  
    \ "Clean"     : "254"
    \ }  
let g:DevIconsEnableFoldersOpenClose = 1
let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1

" NerdTree opens automatically when open target is a directory:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim quits when NerdTree is the only thing left:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" FZF configurations:
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_files_options = ['--reverse']
let g:fzf_action = { 'ctrl-t': 'tab split' }
let $FZF_DEFAULT_OPTS = '--reverse'
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'relativeFileName': 'LightLineFilename'
  \ }
\ }

" NOTE: maybe in future: ultisnips, 
"check youtube test traversal
