call plug#begin('~/.vim/plugged')

" NOTE: Use more: vimux, multiple cursors, vim-test

Plug 'junegunn/fzf', { 'do' : './install --bin' }
Plug 'junegunn/fzf.vim' " TODO: customize this further Lead-P selection should prefill right side, advanced ripgrep, search/replace
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'benmills/vimux'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Handyness
Plug 'w0rp/ale'                                               " Linters
Plug 'maximbaz/lightline-ale'
Plug 'airblade/vim-gitgutter'                                 " GIT gutter
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'                                      " :Gbrowse
Plug 'tpope/vim-eunuch'                                       " UNIX commands like :SudoWrite, :Rename, :Delete
Plug 'tpope/vim-surround'                                     " cs$, cst$, ds$, ysiw$, Visual MODE: S$
Plug 'terryma/vim-multiple-cursors'                           " NOTE: <C-n> is the magic
Plug 'scrooloose/nerdcommenter'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'HerringtonDarkholme/yats' " Typescript syntax
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'elixir' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'lmeijvogel/vim-yaml-helper'

Plug 'racer-rust/vim-racer'
Plug 'ervandew/supertab'                                      " Perform all insert compl with tab
Plug 'timakro/vim-searchant'                                  " Improved search highlighting
Plug 'google/vim-searchindex'                                 " Shows count of matches
Plug 'janko-m/vim-test'

Plug 'junegunn/gv.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'machakann/vim-highlightedyank'
Plug 'jreybert/vimagit', { 'branch': 'next' }

call plug#end()

" Plugin configuration
" let g:test#strategy = "tslime"
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1
let g:indentLine_char = '┆'
let g:indentLine_color_term=235
let g:indentLine_color_gui='#262626'
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
  \ "Modified"  : ["#ff8700", "208", "NONE", "NONE"],
  \ "Staged"    : ["#00875f", "029", "NONE", "NONE"],
  \ "Untracked" : ["#00af5f", "035", "NONE", "NONE"],
  \ "Dirty"     : ["#ff8700", "208", "NONE", "NONE"],
  \ "Clean"     : ["#e4e4e4", "254", "NONE", "NONE"],
  \ "Ignored"   : ["#808080", "NONE", "NONE", "NONE"]
  \ }
let g:DevIconsEnableFoldersOpenClose = 1
" let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0

" NerdTree opens automatically when open target is a directory:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim quits when NerdTree is the only thing left:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show yaml path of any key/value pair
autocmd! InsertLeave *.yml YamlDisplayFullPath
autocmd! CursorMoved *.yml YamlDisplayFullPath
autocmd! InsertLeave *.yaml YamlDisplayFullPath
autocmd! CursorMoved *.yaml YamlDisplayFullPath

let g:rustfmt_autosave = 1

" FZF configurations:
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_files_options = ['--reverse']
let g:fzf_action = { 'ctrl-t': 'tab split' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
let $FZF_DEFAULT_OPTS = '--reverse'

let g:SuperTabDefaultCompletionType = "<c-n>"

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'percent' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'relativeFileName': 'LightLineFilename'
  \ },
  \ 'component_expand': {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \ }
\ }

" NOTE: maybe in future: ultisnips,
" check youtube test traversal
set termguicolors
