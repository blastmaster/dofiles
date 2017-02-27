" setting guioptions to
" a - autoselect vim becomes owner of window in visual mode, the highlighted text
" is automatically yanked into the "* register
" c - use console dialogs instead of popup dialogs
" i - user vim icon
" t - include tearoff menu itmes
" set guioptions=acgit
set guioptions=acit
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

" colorscheme
colorscheme mygithub

let s:fontpattern = '^\([^0-9]\+\)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
let s:defaultfontsize = substitute(&guifont, s:fontpattern, '\2', '')

function! UpdateFontSize(n)
    if has('gui_running')
        let save_cpo = &cpo
        set cpo&vim
        let restorelist = [ &lines, &columns, &cmdheight ]
        let winrestore = [ &winheight, &winwidth, &cmdheight ]
        let fontname = substitute(&guifont, s:fontpattern, '\1', '')
        if (a:n == 0)
            echo "default size" s:defaultfontsize
            let newsize = s:defaultfontsize
        else
            let cursize = substitute(&guifont, s:fontpattern, '\2', '')
            let newsize = cursize + a:n
        endif
        if (newsize <= s:maxfontsize) && (newsize >= s:minfontsize)
            let newfont = fontname . newsize
            let &guifont = newfont
            let [ &lines, &columns, &cmdheight ] = restorelist
            let [ &winheight, &winwidth, &cmdheight ] = winrestore
        endif
        let &cpo = save_cpo
    else
        echoerr "You need to run gVim to use this function!"
    endif
endfunction

function! s:IncrementFontSize()
    call UpdateFontSize(1)
endfunction

function! s:DecrementFontSize()
    call UpdateFontSize(-1)
endfunction

function! s:DefaultFontSize()
    call UpdateFontSize(0)
endfunction

command! IncrementFontSize :call <SID>IncrementFontSize()
command! DecrementFontSize :call <SID>DecrementFontSize()
command! DefaultFontSize   :call <SID>DefaultFontSize()

nnoremap <C-Up> :IncrementFontSize<CR>
nnoremap <C-Down> :DecrementFontSize<CR>
nnoremap <C-Left>   :DefaultFontSize<CR>
