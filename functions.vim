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

let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1

function! MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    new monkey_terminal
    " Moves to the window the right the current one
    wincmd L
      execute "Topen"
     " Change the name of the buffer to "Terminal 1"
     silent file Terminal\ 1
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
     let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:monkey_terminal_window)
    sp
    " Moves to the window below the current one
    wincmd L   
    buffer Terminal\ 1
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
    endif
  endif
endfunction

function! MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen()
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    execute "Ttoggle"
  endif
endfunction
" function g:Multiple_cursors_before()                                                                                                          
"  call deoplete#custom#buffer_option('auto_complete', v:false)                               
" endfunction                                                                                  
" function g:Multiple_cursors_after()                                                          
"    call deoplete#custom#buffer_option('auto_complete', v:true)                                
" endfunction
" Document :Gbrowse, :Gblame
