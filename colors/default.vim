let s:color_darkblue=' ctermfg=024 ctermbg=NONE cterm=NONE guifg=#6C99BB guibg=NONE gui=NONE'
let s:color_blue=' ctermfg=030 ctermbg=NONE cterm=NONE guifg=#7DAF9C guibg=NONE gui=NONE'
let s:color_red=' ctermfg=124 ctermbg=NONE cterm=NONE guifg=#EF5D32 guibg=NONE gui=NONE'
let s:color_orange=' ctermfg=208 ctermbg=NONE cterm=NONE guifg=#EFAC32 guibg=NONE gui=NONE'
let s:color_yellow=' ctermfg=227 ctermbg=NONE cterm=NONE guifg=#D9D762 guibg=NONE gui=NONE'
let s:color_brown=' ctermfg=137 ctermbg=NONE cterm=NONE guifg=#947659 guibg=NONE gui=NONE'
let s:color_white=' ctermfg=254 ctermbg=NONE cterm=NONE guifg=#E6E1C4 guibg=NONE gui=NONE'

exec 'hi Boolean' . s:color_darkblue
exec 'hi Character' . s:color_darkblue
exec 'hi Constant' . s:color_darkblue
exec 'hi Float' . s:color_darkblue
exec 'hi Number' . s:color_darkblue
exec 'hi Directory' . s:color_darkblue
exec 'hi NonText' . s:color_darkblue
" used in modulenamespace:
exec 'hi Type' . s:color_blue

exec 'hi Conditional' . s:color_red
exec 'hi Define' . s:color_red
exec 'hi Statement' . s:color_red
exec 'hi Identifier' . s:color_red
exec 'hi PreProc' . s:color_red

exec 'hi Todo' . s:color_red

" used in js-keys:
exec 'hi Label' . s:color_orange
exec 'hi Keyword' . s:color_orange
exec 'hi Tag' . s:color_orange
exec 'hi Function' . s:color_orange

exec 'hi String' . s:color_yellow

"  this adds strange curly braces coloring in JS should be orange normally
exec 'hi Operator' . s:color_white
exec 'hi Normal' . s:color_white
" this one makes JS params colored + makes elixir quotes
exec 'hi Special' . s:color_white

exec 'hi Comment' . s:color_brown


exec 'hi MatchParen  ctermfg=254 ctermbg=137 cterm=NONE guifg=#E6E1C4 guibg=#947659'
exec 'hi CursorLineNr ' . s:color_orange
exec 'hi CursorLine ctermbg=234 cterm=NONE gui=NONE guibg=#1c1c1c'
exec 'hi SignColumn ctermfg=245 ctermbg=NONE cterm=NONE guifg=#585858 guibg=NONE'
exec 'hi LineNr ctermfg=240 ctermbg=NONE cterm=NONE guifg=#585858 guibg=NONE'

hi Search ctermfg=NONE ctermbg=055 cterm=NONE guifg=NONE guibg=#5f00af
hi SearchCurrent ctermfg=NONE ctermbg=107 cterm=NONE guifg=NONE guibg=#87af5f
hi VertSplit ctermbg=234 ctermfg=234 guibg=#09251f guifg=#1c1c1c
hi ColorColumn ctermbg=234 guibg=#1c1c1c
hi Visual ctermbg=242 guibg=#0d372d
set cc=100

hi Pmenu ctermbg=30 ctermfg=254 guifg=#E6E1C4 guibg=#008787
hi PmenuSel ctermbg=37 ctermfg=254 guifg=#E6E1C4 guibg=#00afaf
exec 'hi Title' . s:color_orange 
" highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
