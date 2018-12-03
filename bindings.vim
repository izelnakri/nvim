:let mapleader = "\<Space>"

" FZF commands
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('right:50%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

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
map <Leader>h  :nohl<CR>
map <Tab>      ==
map qq         :bp<CR>:bd #<CR>

nnoremap <Leader>s :%s//gc<left><left><left>
nnoremap <Leader><C-s> :Far 
nnoremap <Leader>g :Far 

nmap <CR> o<Esc>
" imap ii <Esc>
nmap <Leader>' :s/\'\(.*\)\'/\"\1\"<CR>:nohl<CR> " TODO: check what this is
nmap <space> :w<CR>

map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Switching between buffers with arrow keys
nmap <silent> <C-e>k :wincmd k<CR>
nmap <silent> <C-e>j :wincmd j<CR>
nmap <silent> <C-e>h :wincmd h<CR>
nmap <silent> <C-e>l :wincmd l<CR>

map <C-k>      :wincmd j<CR>
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

" FZF - https://github.com/junegunn/fzf/blob/master/README-VIM.md
nmap <Leader>p  :Files<CR>
nmap <Leader>t  :Files<CR>
nmap <Leader>f  :Rg!<CR>
nmap <D-t>  :Files<CR>
nmap <Leader>b  :Buffers<CR>
 
nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(BufferList()),
\   'sink':    function('BufferOpen'),
\   'options': '+m',
\   'down':    len(BufferList()) + 2
\ })<CR>

" Test bindings:
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"let test#neovim#term_position = "topleft"

