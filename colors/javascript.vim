let s:color_darkblue=' ctermfg=024 ctermbg=NONE cterm=NONE guifg=#6C99BB guibg=NONE'
let s:color_blue=' ctermfg=030 ctermbg=NONE cterm=NONE guifg=#7DAF9C guibg=NONE'
let s:color_red=' ctermfg=124 ctermbg=NONE cterm=NONE guifg=#EF5D32 guibg=NONE'
let s:color_orange=' ctermfg=208 ctermbg=NONE cterm=NONE guifg=#EFAC32 guibg=NONE'
let s:color_yellow=' ctermfg=227 ctermbg=NONE cterm=NONE guifg=#D9D762 guibg=NONE'
let s:color_brown=' ctermfg=137 ctermbg=NONE cterm=NONE guifg=#947659 guibg=NONE'
let s:color_white=' ctermfg=254 ctermbg=NONE cterm=NONE guifg=#E6E1C4 guibg=NONE'

exec 'hi javascriptFuncKeyword' . s:color_red
exec 'hi javaScriptOpSymbols' . s:color_red
exec 'hi javascriptCommentTodo' . s:color_red
exec 'hi javascriptAsyncFuncKeyword' . s:color_red
exec 'hi javascriptAwaitFuncKeyword' . s:color_red 
exec 'hi javascriptEndColons' . s:color_white

highlight link javascriptBraces Operator
highlight link javascriptBrackets Operator
