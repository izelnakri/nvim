let s:color_darkblue=' ctermfg=024 ctermbg=NONE cterm=NONE guifg=#6C99BB guibg=NONE gui=NONE'
let s:color_blue=' ctermfg=030 ctermbg=NONE cterm=NONE guifg=#7DAF9C guibg=NONE gui=NONE'
let s:color_red=' ctermfg=124 ctermbg=NONE cterm=NONE guifg=#EF5D32 guibg=NONE gui=NONE'
let s:color_orange=' ctermfg=208 ctermbg=NONE cterm=NONE guifg=#EFAC32 guibg=NONE gui=NONE'
let s:color_yellow=' ctermfg=227 ctermbg=NONE cterm=NONE guifg=#D9D762 guibg=NONE gui=NONE'
let s:color_brown=' ctermfg=137 ctermbg=NONE cterm=NONE guifg=#947659 guibg=NONE gui=NONE'
let s:color_white=' ctermfg=254 ctermbg=NONE cterm=NONE guifg=#E6E1C4 guibg=NONE gui=NONE'

exec 'hi typescriptFuncKeyword' . s:color_red
exec 'hi typescriptOpSymbols' . s:color_red
exec 'hi typescriptCommentTodo' . s:color_red
exec 'hi typescriptIdentifier' . s:color_blue
" exec 'hi javascriptAsyncFuncKeyword' . s:color_red
" exec 'hi javascriptAwaitFuncKeyword' . s:color_red
exec 'hi typescriptEndColons' . s:color_white

highlight link typescriptReserved Identifier
highlight link typescriptOperator Identifier
highlight link typescriptLabel Identifier
highlight link typescriptStorageClass Identifier
highlight link typescriptLogicSymbols Identifier
highlight link typescriptBraces Operator
highlight link typescriptBracket Operator
