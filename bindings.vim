" zR open all folds, zM close all folds
" [q previous quickfix item, ]q next quickfix item

let mapleader = "\<Space>"

" persist selection for indent/dedent
vnoremap > >gv
vnoremap < <gv

" Should probably work, if it doesnt work remove this comment
nnoremap ; :
" nnoremap : ;

" what is this? investigate
inoremap jk <esc>

command! -bar -nargs=1 -bang Write
  \ execute '!sudo touch %:p:h/'.(<q-args>)

" Removes annoying swap warnings
command! RmSwp
  \ execute '!rm /var/tmp/*.swp'

" shows colors
command! Colors execute 'so $VIMRUNTIME/syntax/hitest.vim'

" copy filename
command! Name execute ':!echo % | xsel --clipboard --input'

" format code with Prettier
" nnoremap gp :silent %!prettier --stdin-filepath %<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" vim fugitive(git) go back binding to ..
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" FZF commands
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('right:50%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('right:50%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" General bindings
map <Leader>w  :w<CR>
map <Leader>h  :nohl<CR><Plug>SearchantStop
map <Tab>      ==
map qq         :bp<CR>:bd #<CR>
map <silent> <M-a> gg<S-v>G
inoremap <silent> <M-a> <Esc>gg<S-v>G
map <silent> <C-s> %
map <F7> gg=G<C-o><C-o>

" Move vim copy to clipboard:
" set clipboard+=unnamedplus
set clipboard^=unnamed,unnamedplus

nnoremap <Leader>s :%s//gc<left><left><left>
nnoremap <Leader>/ :%s///gn<CR>
" nnoremap <Leader><C-s> :Far
" nnoremap <Leader>g :Far

nmap <CR> o<Esc>
" imap ii <Esc>

" TODO: check what this is:
nmap <Leader>' :s/\'\(.*\)\'/\"\1\"<CR>:nohl<CR>
nmap <space> :w<CR>

map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Switching between buffers with arrow keys
nmap <silent> <C-e>h :wincmd h<CR>
nmap <silent> <C-e>l :wincmd l<CR>

" map <C-h>      :wincmd h<CR>
" map <C-l>      :wincmd l<CR>
nmap <C-w> :wincmd w<CR>

" Ctag navigation, ctrl+\ -> opens tag in new tab, Alt+] opens tag vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" NERDTree
map <Leader>nf :NERDTreeFind<CR>
map <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p> " refreshes Nerdtree index

" Neoclide Tab S-Tab Completion toggle
imap <C-j> <Tab>
imap <C-k> <S-Tab>

" Gundo
" nnoremap <leader>u :GundoToggle<CR>

" FZF - https://github.com/junegunn/fzf/blob/master/README-VIM.md
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nmap <Leader>p  :call FZFOpen(':Files')<CR>
nmap <Leader>t  :call FZFOpen(':Files')<CR>
nmap <Leader>f  :call FZFOpen(':Rg!')<CR>
nmap <D-t>  :call FZFOpen(':Files')<CR>
nmap <Leader>b  :call FZFOpen(':Buffers')<CR>

autocmd BufWritePre * %s/\s\+$//e " Removes trailing whitespace

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(BufferList()),
\   'sink':    function('BufferOpen'),
\   'options': '+m',
\   'down':    len(BufferList()) + 2
\ })<CR>

" Ale bindings:
nnoremap ln :lnext<CR>
nnoremap lp :lprevious<CR>
nnoremap lr :lrewind<CR>
nnoremap lc :lclose<CR>
nnoremap <leader>lf :ALEFix<CR>

" Test bindings:
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
map <Leader>r :reg<CR>

nmap <S-j> <Nop>

" select current word:
map <Leader>8 *<S-n>

" Gfigutive stuff
map <Leader>gb :Git blame<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gl :0Glog<CR>
map <Leader>gp :Glog<CR>
map <Leader>mg :Magit<CR>
map <Leader>q :q<CR>

" Gfiguive like custom stuff:
" map <Leader>
" :sv !+git\ branch
" https://neovim.io/doc/user/windows.html
" https://github.com/tpope/vim-fugitive


" Gitmerge bindings:
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

" Move lines
" in Normal mode
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==

" in Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" in Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Coc shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Compile rmarkdown
autocmd FileType rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
