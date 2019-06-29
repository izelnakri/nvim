let mapleader = "\<Space>"

" persist selection for indent/dedent
vnoremap > >gv
vnoremap < <gv

" what is this? investigate
inoremap jk <esc>

command! -bar -nargs=1 -bang Write
  \ execute '!sudo touch %:p:h/'.(<q-args>)

" Removes annoying swap warnings
command! RmSwp
  \ execute '!rm /var/tmp/*.swp'

" shows colors
command! Colors execute 'so $VIMRUNTIME/syntax/hitest.vim'

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

map <C-h>      :wincmd h<CR>
map <C-l>      :wincmd l<CR>
map <C-w>      <C-w><C-w>

" Ctag navigation, ctrl+\ -> opens tag in new tab, Alt+] opens tag vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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

" Test bindings:
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
map <Leader>r :reg<CR>

nmap <S-j> <Nop>

