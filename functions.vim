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

" function g:Multiple_cursors_before()                                                                                                          
"  call deoplete#custom#buffer_option('auto_complete', v:false)                               
" endfunction                                                                                  
" function g:Multiple_cursors_after()                                                          
"    call deoplete#custom#buffer_option('auto_complete', v:true)                                
" endfunction
" Document :Gbrowse, :Gblame
