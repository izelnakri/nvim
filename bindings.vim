let mapleader = "\<Space>"

" persist selection for indent/dedent
vnoremap > >gv
vnoremap < <gv

command! -bar -nargs=1 -bang Write
  \ execute '!sudo touch %:p:h/'.(<q-args>) 

command! RmSwp
  \ execute '!rm /var/tmp/*.swp'

" TODO: create a terminal command that opens a vsplit terminal
" terminal navigation mapping

" TODO: make this toggle terminal
command! Terminal \ execute 'set splitright' | vsplit | terminal if has('nvim')

" Neoterm shortcuts
tnoremap <C-w> <C-\><C-n>:wincmd h<CR>
tnoremap <Leader>k clear<CR>
tnoremap <Leader>, <C-\><C-n>:execute MonkeyTerminalToggle()<CR>
map <Leader>, :execute MonkeyTerminalToggle()<CR> 
map <Leader>. :execute MonkeyTerminalInput()<CR>i

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
map <Leader>h  :nohl<CR><Plug>SearchantStop
map <Tab>      ==
map qq         :bp<CR>:bd #<CR>
map <silent> <M-a> gg<S-v>G
inoremap <silent> <M-a> <Esc>gg<S-v>G
map <silent> <C-s> %

" Move vim copy to clipboard:
" set clipboard+=unnamedplus
set clipboard^=unnamed,unnamedplus

nnoremap <Leader>s :%s//gc<left><left><left>
nnoremap <Leader><C-s> :Far 
nnoremap <Leader>g :Far 

nmap <CR> o<Esc>
" imap ii <Esc>
nmap <Leader>' :s/\'\(.*\)\'/\"\1\"<CR>:nohl<CR> " TODO: check what this is
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
 
" TODO: DOUGS plugin:
if exists('loaded_easydir')
  finish
endif
let loaded_easydir = 1

autocmd BufWritePre * %s/\s\+$//e " Removes trailing whitespace

augroup easydir
  au!
  au BufAdd * call FZFOpen('') 
  au BufWritePre,FileWritePre * call <SID>create_and_save_directory()
augroup END

function <SID>create_and_save_directory()
  let s:directory = expand('<afile>:p:h')
  if s:directory !~# '^\(scp\|ftp\|dav\|fetch\|ftp\|http\|rcp\|rsync\|sftp\|file\):'
  \ && !isdirectory(s:directory)
    call mkdir(s:directory, 'p')
  endif
endfunction

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

" Test bindings:
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
map <Leader>r :reg<CR>
