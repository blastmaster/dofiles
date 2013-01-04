"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "mydante"

" General colors
hi Normal   ctermfg=gray    guifg=white     guibg=black

hi Directory	term=bold   ctermfg=blue  guifg=royalblue

hi ErrorMsg	term=standout ctermfg=white ctermbg=red guifg=white guibg=red3

hi NonText	term=bold ctermfg=darkgray guibg=gray3 guifg=gray20

hi SpecialKey	term=bold ctermfg=darkgray guifg=gray30

hi LineNr	ctermfg=darkgray guifg=ivory4 guibg=gray4

hi IncSearch	term=reverse cterm=reverse gui=reverse,bold guifg=darkgoldenrod2

hi Search	term=reverse ctermfg=black ctermbg=yellow guifg=gray10 guibg=gold2

"hi Visual	term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black gui=bold,reverse guifg=gray40 guibg=black

"hi VisualNOS	term=bold cterm=bold gui=bold

hi MoreMsg	term=bold ctermfg=green gui=bold guifg=olivedrab1
hi ModeMsg	term=bold cterm=bold gui=bold
hi Question	term=standout ctermfg=green gui=bold guifg=olivedrab1
hi WarningMsg	term=standout ctermfg=red gui=bold guifg=red3
hi WildMenu     term=standout ctermfg=black ctermbg=34 guifg=black guibg=34

" hi Folded    term=standout ctermfg=blue ctermbg=white guifg=royalblue1 guibg=white
" hi FoldColumn	   term=standout ctermfg=blue ctermbg=white guifg=royalblue3 guibg=white

hi Folded ctermfg=62 ctermbg=234
hi FoldColumn ctermfg=62 ctermbg=234

hi DiffAdd	term=bold ctermbg=blue guibg=royalblue2
hi DiffChange	term=bold ctermbg=darkmagenta guibg=maroon
hi DiffDelete	term=bold cterm=bold ctermfg=lightblue ctermbg=cyan gui=bold guifg=lightblue guibg=cyan4
hi DiffText	term=reverse cterm=bold ctermbg=red gui=bold guibg=red3
hi Cursor	guifg=bg guibg=fg
hi lCursor	guifg=bg guibg=fg

hi StatusLine   guifg=#000000  guibg=#696969    gui=NONE
            \   ctermfg=28     ctermbg=233      cterm=bold
hi StatusLineNC guifg=#000000   guibg=#696969   gui=NONE
            \   ctermfg=black   ctermbg=238     cterm=bold

hi StatusLineNC	term=reverse cterm=reverse gui=reverse guifg=gray40

" hi VertSplit	term=reverse cterm=reverse gui=bold,reverse guifg=gray40
hi VertSplit ctermfg=233 ctermbg=63 cterm=NONE
hi Title	term=bold ctermfg=magenta gui=bold guifg=aquamarine

" {{{
" cursor / dynamic / other {{{
hi ColorColumn  guifg=NONE      guibg=#220000   gui=NONE
            \   ctermfg=NONE    ctermbg=52      cterm=bold
hi Cursor       guifg=#000000   guibg=#ffff99   gui=NONE
            \   ctermfg=black   ctermbg=white   cterm=reverse
hi CursorIM     guifg=NONE      guibg=#aaccff   gui=NONE
            \   ctermfg=black   ctermbg=white   cterm=reverse
hi CursorLine   guifg=NONE      guibg=#1b1b1b   gui=NONE
            \   ctermfg=NONE     ctermbg=233     cterm=NONE
hi CursorColumn guifg=NONE      guibg=#1b1b1b   gui=NONE
            \   ctermfg=NONE    ctermbg=16      cterm=NONE
hi CursorLineNr guifg=a0a000    guibg=NONE      gui=bold
            \   ctermfg=154     ctermbg=238     cterm=bold

hi Visual       guifg=#ffffff   guibg=#606070   gui=NONE
            \   ctermfg=193     ctermbg=233     cterm=NONE
hi IncSearch    guifg=#000000   guibg=#eedd33   gui=bold
            \   ctermfg=white   ctermbg=yellow  cterm=NONE
hi Search       guifg=#efefd0   guibg=#937340   gui=NONE
            \   ctermfg=white   ctermbg=64      cterm=NONE
hi MatchParen   guifg=NONE      guibg=#3377aa   gui=NONE
            \   ctermfg=white   ctermbg=blue    cterm=NONE
"}}}

" {{{
" tabs
hi TabLine     ctermfg=white ctermbg=235 cterm=bold
hi TabLineFill ctermfg=white ctermbg=232 cterm=bold
hi TabLineSel  ctermfg=white ctermbg=34 cterm=bold

"}}}

" syntax hi colors
hi Comment	term=bold ctermfg=darkcyan guifg=cyan4

hi PreProc	ctermfg=brown guifg=dodgerblue4

hi Constant	ctermfg=darkred guifg=firebrick3

hi Type		ctermfg=darkgreen gui=none guifg=chartreuse3
hi Statement	term=bold ctermfg=darkyellow gui=none guifg=gold3

hi Identifier	ctermfg=darkgreen guifg=darkolivegreen4
hi Ignore	term=bold ctermfg=darkgray guifg=gray45

hi Special	ctermfg=brown guifg=sienna
hi Error	term=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red3
hi Todo		term=standout ctermfg=black ctermbg=yellow gui=bold guifg=gray10 guibg=yellow4

"hi Underlined	term=underline cterm=underline ctermfg=darkblue gui=underline guifg=slateblue

hi Number	ctermfg=darkred guifg=red2
" syntax hi links
hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number
hi link Function	Identifier
hi link Number		Constant
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Operator	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
