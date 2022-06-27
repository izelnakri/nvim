" :retab! : convert tabs to spaces
" :IEX - iex shell, add irb and node shell
" * : makes word selection
" :only
" :Gvsplit branchname:filename
" Git shortcuts [:Gread(revert), :Gwrite, :Gremove, :Gcommit, :Gdiff]
" Gstatus [- key on files, C-n/C-p]
" :Gedit :0 [staged version]
" :Gdiff then :diffget, :diffput | use :dp for 3-way + :Gwrite to finish + !
" Learn ripgrep and fzf better
" investigate better merge conflicts [:ls, :diffget 2] :diffupdate [c ]c
" :Gedit [sha]
" for trees use this command: :edit %:h
" for the commit object press S-c, for current just press :Gedit
"
" [q ]q  [Q ]Q
" Magit shortcuts and speed

" Auto closing vim
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Tab key behaviour
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Buffers
function! BufferList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufferOpen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Document :Gbrowse, :Gblame
" " Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
        \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" function! WordCount()
"     let currentmode = mode()
"     if !exists("g:lastmode_wc")
"         let g:lastmode_wc = currentmode
"     endif
"     " if we modify file, open a new buffer, be in visual ever, or switch modes
"     " since last run, we recompute.
"     if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
"         let g:lastmode_wc = currentmode
"         let l:old_position = getpos('.')
"         let l:old_status = v:statusmsg
"         execute "silent normal g\<c-g>"
"         if v:statusmsg == "--No lines in buffer--"
"             let b:wordcount = 0
"         else
"             let s:split_wc = split(v:statusmsg)
"             if index(s:split_wc, "Selected") < 0
"                 let b:wordcount = str2nr(s:split_wc[11])
"             else
"                 let b:wordcount = str2nr(s:split_wc[5])
"             endif
"             let v:statusmsg = l:old_status
"         endif
"         call setpos('.', l:old_position)
"         return b:wordcount
"     else
"         return b:wordcount
"     endif
"   endfunction

set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
