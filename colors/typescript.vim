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
exec 'hi typescriptAsyncFunc' . s:color_red
exec 'hi typescriptAsyncFuncKeyword' . s:color_red
exec 'hi typescriptTypeReference' . s:color_red
exec 'hi typescriptEndColons' . s:color_white

exec 'hi typescriptSuperBlock' . s:color_red
exec 'hi typescriptInterpolationDelimiter' . s:color_orange
exec 'hi typescriptAliasDeclaration' . s:color_orange
" exec 'hi typescriptSpecial' . s:color_red
" exec 'hi typescriptSource' . s:color_blue
exec 'hi typescriptDecorators' . s:color_orange
exec 'hi typescriptObjectLabel' . s:color_orange

highlight link typescriptReserved Identifier
highlight link typescriptOperator Identifier
highlight link typescriptLabel Identifier
highlight link typescriptStorageClass Identifier
highlight link typescriptLogicSymbols Identifier
highlight link typescriptBraces Operator
highlight link typescriptBracket Operator

hi link typescriptArrowFunc Identifier
hi link typescriptSpecial Identifier
hi link typescriptImport Identifier
hi link typescriptExport Identifier
hi link typescriptModule Identifier
hi link typescriptDecorator Identifier
hi link typescriptFuncType Identifier
hi link typescriptCastKeyword Identifier

exec 'hi typescriptArrowFuncArg' . s:color_blue
exec 'hi typescriptFuncArg' . s:color_blue
" this is function arguments:
exec 'hi typescriptCall' . s:color_white
