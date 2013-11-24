" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light
    hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="mygithub"

" {{{ Basics
hi Normal       ctermbg=255 ctermfg=16  guifg=#000000 guibg=#F8F8FF
hi Directory	guifg=#5785bb guibg=bg      gui=bold
hi LineNr		guifg=#959595 guibg=#ECECEC 
hi NonText		guifg=#808080 guibg=#ECECEC
" }}}

" {{{ Cursor
hi Cursor		guibg=#444454   guifg=bg gui=NONE
hi CursorLine	guibg=#D8D8DD               gui=NONE
hi ColorColumn  ctermfg=NONE    ctermbg=52  cterm=bold  guifg=NONE  guibg=#ff0000   gui=NONE
" hi CursorColumn guifg=NONE      guibg=#E8E8EE   gui=NONE
hi CursorColumn  ctermfg=NONE   ctermbg=52  cterm=bold  guifg=NONE  guibg=#800000   gui=NONE
" }}}

" {{{ Diff
hi DiffAdd         guifg=#003300 guibg=#DDFFDD gui=none
hi DiffChange                    guibg=#ececec gui=none
hi DiffText        guifg=#000033 guibg=#DDDDFF gui=none
hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD gui=none
" }}}

" {{{ Folding
hi Folded		guibg=#ECECEC guifg=#808080 gui=bold
hi FoldColumn	guibg=#ECECEC guifg=#808080 gui=bold
" }}}

hi VertSplit	guibg=#bbbbbb guifg=#bbbbbb gui=none

hi StatusLine   guibg=#bbbbbb guifg=#404040 gui=bold
hi StatusLineNC guibg=#d4d4d4 guifg=#404040 gui=italic


" {{{ Misc
hi ModeMsg		guifg=#990000
hi MoreMsg		guifg=#990000

hi ErrorMsg     cterm=bold  ctermbg=bg  ctermfg=196   guibg=bg    guifg=#ff0000 gui=bold

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
hi SpecialKey   guifg=#177F80 gui=italic

hi MatchParen	guibg=#cdcdfd guifg=fg
hi Underlined	guifg=fg gui=underline
" }}}

" {{{ Search, Visual, etc
hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
hi IncSearch	guibg=#cdcdfd guifg=fg gui=italic
hi Search		guibg=#cdcdfd guifg=fg gui=italic
" }}}


" {{{ Completion menus
hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none

" {{{ Pmenu highlighting for pop up menu
hi Pmenu        guibg=#808080 guifg=#ffffff gui=bold
hi PmenuSel     guibg=#cdcdfd guifg=#000000 gui=italic
hi PmenuSbar    guibg=#000000 guifg=#444444
hi PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa
" }}}

" {{{ Tabs
hi TabLine      ctermfg=white   ctermbg=235 cterm=bold  guifg=#FFFFFF   guibg=#3E3E3E   gui=bold
hi TabLineFill  ctermfg=white   ctermbg=232 cterm=bold  guifg=#FFFFFF   guibg=#dddddd   gui=bold
hi TabLineSel   ctermfg=white   ctermbg=34  cterm=bold  guifg=#FFFFFF   guibg=#007700   gui=bold
" }}}

" {{{ Spelling
if has('spell')
    hi spellBad     guisp=#fcaf3e
    hi spellCap     guisp=#73d216
    hi spellRare    guisp=#fcaf3e
    hi spellLocal   guisp=#729fcf
endif
" }}}

" {{{ Syntax groups
hi Ignore		guifg=#808080
hi Identifier	guifg=#0086B3
hi PreProc		guifg=#ac4311 gui=bold
hi Comment		guifg=#00a400
hi Constant     guifg=#ff0000
"hi Constant		guifg=#177F80 gui=none
hi String		guifg=#D81745
hi Function		guifg=#990000 gui=bold

" hi Statement	guifg=#ffaa00 gui=bold
hi Statement    guifg=#8000ff gui=bold

" hi Type			guifg=#445588 gui=bold
hi Type			guifg=#768aa4 gui=bold

" hi Number		guifg=#1C9898
hi Special		guifg=#159828 gui=bold
hi rubySymbol   guifg=#960B73
hi Error        guibg=bg    guifg=#ff1100 gui=undercurl
hi Todo         guibg=bg    guifg=#ff1100 gui=underline,bold
hi Label        guifg=fg    gui=bold
hi StorageClass guifg=fg    gui=bold
hi TypeDef      guifg=fg    gui=bold
"missing highlight classes could also been aliases
"hi Boolean
hi link Operator    Statement
hi link Conditional Statement
hi link Repeat      Statement
hi link Keyword     Statement
hi link Exception   Statement
hi link Include     PreProc
hi link Define      PreProc
hi link Macro       PreProc
"hi PreCondit
"hi Typedef
"hi Tag
"hi SpecialChar
"hi Delimiter
"hi SpecialComment
"hi Debug
" }}}

" {{{ Aliases
hi link Number          Constant
hi link Float           Constant
hi link String          Constant
hi link Character		Constant
hi link Boolean         Constant


" old stuff
hi link cppSTL          Function
hi link cppSTLType      Type
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" vim: sw=4 ts=4 foldmethod=marker
