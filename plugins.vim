call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do' : './install --bin' }
Plug 'junegunn/fzf.vim' " TODO: customize this further Lead-P selection should prefill right side, advanced ripgrep, search/replace
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree' 
Plug 'ryanoasis/vim-devicons'

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " TODO: AutoComplete framework

" Languages
" Plug 'python-mode/python-mode', { 'branch': 'master' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'HerringtonDarkholme/yats' " Typescript syntax
Plug 'othree/es.next.syntax.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim' " TODO

" maybe add minimap, ultisnips, customize fzf for bat and ripgrep
" customize git plugin to show the recent branch

call plug#end()

" Plugin configuration
let g:NERDTreeHijackNetrw=0
let g:NERDTreeChDirMode=2
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:deoplete#enable_at_startup = 1

" NerdTree open directory with tree:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
highlight VertSplit ctermbg=024 highlight VertSplit ctermfg=024

" Vim quits when NerdTree is the only thing left:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" FZF configurations:
let g:fzf_layout = { 'down': '~20%' }
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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

" https://hackernoon.com/5-vim-plugins-i-cant-live-without-for-javascript-development-f7e98f98e8d5
" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9

" https://github.com/tpope/vim-surround
" " maybe syntastic, vim-test, supertab?, check youtube test traversal
