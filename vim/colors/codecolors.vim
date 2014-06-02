"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set background=dark
"
" Relevant Help:
" :h highlight-groups
" :h psc-cterm-color-table

hi clear

if exists("syntax on")
    syntax reset
endif

let g:colors_name = "codecolors"

if &background == 'dark'

    " {{{ Basics
    hi Normal		ctermfg=gray	guifg=#A3A3A3	guibg=#333333
    hi Directory	cterm=bold		ctermfg=blue    guifg=#5785bb guibg=bg  gui=bold
    hi ErrorMsg		cterm=standout	ctermfg=white	ctermbg=red		guifg=#FFFFFF	guibg=#BF0303
    hi NonText		cterm=bold		ctermfg=darkgray	guibg=#1A1A1A	guifg=#888888
    hi SpecialKey	term=bold       ctermfg=darkgray     guifg=gray30
    hi LineNr		ctermfg=darkgray guifg=#3B3B3B guibg=#151515
    hi IncSearch	term=reverse cterm=reverse gui=bold guifg=#3d3d3d guibg=#3D3D3D
    hi Search		term=reverse ctermfg=black ctermbg=yellow   guifg=#3d3d3d guibg=#3d3d3d
    " }}}
    "hi Visual	term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black gui=bold,reverse guifg=gray40 guibg=black
    "hi VisualNOS	term=bold cterm=bold gui=bold
    hi MoreMsg	    term=bold       ctermfg=green   gui=bold    guifg=olivedrab1
    hi ModeMsg	    term=bold       cterm=bold      gui=bold
    hi Question	    term=standout   ctermfg=green   gui=bold    guifg=olivedrab1
    hi WarningMsg	term=standout   ctermfg=red     gui=bold    guifg=red3
    hi WildMenu     ctermfg=black   ctermbg=34  cterm=bold  guifg=black guibg=#006C00   gui=bold
    " {{{ Foldings
    hi Folded       ctermfg=69  ctermbg=234 guifg=#5785bb   guibg=bg    gui=bold
    hi FoldColumn   ctermfg=69  ctermbg=234 guifg=#5785bb   guibg=bg    gui=bold
    " }}}
    " {{{ Diff 00a400
    hi DiffAdd	    ctermbg=blue        guibg=#003300 guifg=#00ff00
    hi DiffChange	ctermbg=darkmagenta guibg=#030303
    hi DiffDelete	cterm=bold  ctermfg=lightblue ctermbg=cyan guifg=#bf0000 guibg=bg gui=bold
    hi DiffText	    cterm=bold  ctermbg=red guibg=red3 gui=bold
    " }}}
    hi Cursor	guifg=bg guibg=fg
    hi lCursor	guifg=bg guibg=fg
    " {{{ StatusLine
    hi StatusLine   guifg=#000000  guibg=#696969    gui=NONE
                \   ctermfg=28     ctermbg=233      cterm=bold
    hi StatusLineNC guifg=#000000   guibg=#696969   gui=NONE
                \   ctermfg=black   ctermbg=238     cterm=bold
    hi StatusLineNC	term=reverse cterm=reverse gui=reverse guifg=gray40
    " }}}

    " {{{ Sign Column
    hi SignColumn   guibg=#1b1b1b guifg=NONE    gui=bold
                \   ctermbg=232   ctermfg=NONE  cterm=bold
    " }}}

    " {{{ Pmenu Completion
    hi Pmenu         ctermfg=white guifg=#FFFFFF      ctermbg=236   guibg=#555555    cterm=NONE gui=bold
    hi PmenuSel      ctermfg=white guifg=#FFFFFF      ctermbg=24    guibg=#003F9D    cterm=NONE gui=italic
    hi PmenuSbar     ctermfg=black guifg=#000000      ctermbg=black guibg=#FFFFFF    cterm=NONE
    hi PmenuThumb    ctermfg=gray  guifg=#888888      ctermbg=gray  guibg=#888888    cterm=NONE
    " }}}
    hi VertSplit ctermfg=233 ctermbg=NONE cterm=NONE
    hi Title	term=bold ctermfg=magenta gui=bold guifg=aquamarine
    " {{{
    " cursor / dynamic / other {{{
    hi ColorColumn  guifg=NONE      guibg=#800000   gui=NONE
                \   ctermfg=NONE    ctermbg=52      cterm=bold
    hi Cursor       guifg=#000000   guibg=#ffff99   gui=NONE
                \   ctermfg=black   ctermbg=white   cterm=reverse
    hi CursorIM     guifg=NONE      guibg=#aaccff   gui=NONE
                \   ctermfg=black   ctermbg=white   cterm=reverse
    hi CursorLine   guifg=NONE      guibg=#1b1b1b   gui=NONE
                \   ctermfg=NONE     ctermbg=233     cterm=NONE
    hi CursorColumn guifg=NONE      guibg=#1b1b1b   gui=NONE
                \   ctermfg=NONE    ctermbg=16      cterm=NONE
    hi CursorLineNr guifg=#a0a000    guibg=NONE      gui=bold
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
    " {{{ Tabs
    hi TabLine     ctermfg=white ctermbg=235 cterm=bold guifg=#FFFFFF guibg=#3E3E3E gui=bold
    hi TabLineFill ctermfg=white ctermbg=232 cterm=bold guifg=#FFFFFF guibg=#161616 gui=bold
    hi TabLineSel  ctermfg=white ctermbg=34  cterm=bold guifg=#FFFFFF guibg=#007700 gui=bold
    "}}}
    " {{{ Spelling
    if has('spell')
        hi spellBad     guisp=#fcaf3e
        hi spellCap     guisp=#73d216
        hi spellRare    guisp=#fcaf3e
        hi spellLocal   guisp=#729fcf
    endif
    " }}}

    " {{{ Syntax
    " hi Comment	    term=bold ctermfg=darkcyan guifg=cyan4
    hi Comment	    term=bold ctermfg=darkcyan guifg=#00a400
    hi PreProc	    ctermfg=brown guifg=#ac4311 gui=bold
    hi Constant	    ctermfg=darkred guifg=firebrick3
    " hi Type		    ctermfg=darkgreen gui=none guifg=chartreuse3
    hi Type		    ctermfg=darkgreen guifg=#a4c0e4 gui=bold
    hi Statement	term=bold ctermfg=darkyellow gui=bold guifg=#ffaa00
    hi Identifier	ctermfg=darkgreen guifg=darkolivegreen4
    hi Ignore	    term=bold ctermfg=darkgray guifg=gray45
    hi Special	    ctermfg=brown guifg=sienna
    hi Error	    cterm=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red3    gui=undercurl
    hi Todo		    term=standout ctermfg=black ctermbg=yellow gui=bold guifg=gray10 guibg=yellow4
    hi Number	    ctermfg=darkred guifg=red2
    "hi Underlined	term=underline cterm=underline ctermfg=darkblue gui=underline guifg=slateblue

    " syntax hi links
    hi link String		    Constant
    hi link Character	    Constant
    hi link Number		    Constant
    hi link Boolean		    Constant
    hi link Float		    Constant
    hi link Function	    Identifier
    hi link Number		    Constant
    hi link Conditional	    Statement
    hi link Repeat		    Statement
    hi link Label		    Statement
    hi link Keyword		    Statement
    hi link Exception	    Statement
    hi link Operator	    Statement
    hi link Include		    PreProc
    hi link Define		    PreProc
    hi link Macro		    PreProc
    hi link PreCondit       PreProc
    hi link StorageClass	Type
    hi link Structure	    Type
    hi link Typedef		    Type
    hi link Tag		        Special
    hi link SpecialChar	    Special
    hi link Delimiter	    Special
    hi link SpecialComment	Special
    hi link Debug		    Special
    " }}}

" light variant
elseif &background == 'light'

    " {{{ Basics
    hi Normal       guifg=#000000 guibg=#F8F8FF
            \       ctermbg=255 ctermfg=16 cterm=bold
    hi Directory	guifg=#5785bb guibg=bg      gui=bold
    hi LineNr		guifg=#959595 guibg=#ECECEC
    hi NonText		guifg=#808080 guibg=#ECECEC
            \       ctermfg=142   ctermbg=255
    " }}}

    " {{{ Cursor
    hi Cursor		ctermbg=55 ctermfg=232 cterm=NONE guibg=#444454   guifg=bg gui=NONE
    hi lCursor	    guifg=bg guibg=fg
    hi CursorLine	guibg=#D8D8DD               gui=NONE
                \   ctermbg=253 cterm=NONE
    hi CursorLineNr guifg=#a0a000    guibg=NONE      gui=bold
                \   ctermfg=69      ctermbg=251      cterm=bold
    hi CursorColumn  ctermfg=NONE   ctermbg=52  cterm=bold  guifg=NONE  guibg=#800000   gui=NONE
    " }}}

    " {{{ SignColumn
    hi SignColumn   guibg=#F8F8FF guifg=#B40000 gui=bold
                \   ctermbg=154   ctermbg=255   cterm=bold
    " }}}

    " {{{ Diff
    hi DiffAdd         guifg=#003300 guibg=#DDFFDD gui=none
    hi DiffChange                    guibg=#ececec gui=none
    hi DiffText        guifg=#000033 guibg=#f80800 gui=bold
    hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD gui=bold
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
    hi link Structure       Type

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

endif " &background
" vim sw=4 ts=4 foldmethod=marker
