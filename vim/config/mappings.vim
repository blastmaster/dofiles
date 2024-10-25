" TODO: register just one key for each filetype use /usr/bin/env interpreter
noremap <F11> i#! /bin/bash<ESC>o

" insert current date
noremap <F1> :put=strftime('%F')<CR>
" insert current time
noremap <F2> :put=strftime('%R:%S')<CR>

noremap <F10> :noh<CR> " turn off search highlighting

" include visual line marking 100 characters
set colorcolumn=100
nnoremap <F4> :if &colorcolumn == 100<Bar>set colorcolumn=0<Bar>else<Bar>set colorcolumn=100<Bar>endif<CR>

" toggle tabline
noremap <F6> :if &showtabline == 1<Bar>set showtabline=0<Bar>else<Bar>set showtabline=1<Bar>endif<CR>
" toggle syntastic
noremap <F5> :SyntasticToggleMode<CR>
" toggle linenumbers
noremap <F8> :set number!<CR>
" toggle cursorline
nnoremap <F3> :set cursorline!<CR>

" editing vimrc file quickly
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" insert a line of '-' dashes
" TODO: can we use textwidth instead of setting the 80 character hardcoded?
nnoremap <leader>ml 80i-<Esc>

" when jumping between matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" TODO what is the difference between changelist and jumplist?
" same when jumping through changelist
nnoremap g; g;zz
nnoremap g, g,zz

" Sort lines
nnoremap <leader>s vip:!sort<CR>
vnoremap <leader>s :!sort<CR>

" uppercase ???
inoremap <c-u> <esc>mzgUiw`za

" don't move on *
nnoremap * *<c-o>
" clear trailing whitespaces
nnoremap <leader>. :%s/\s\+$//<CR>:let @/=''<CR>
" align text, normal mappings
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>
" align text, visual mappings
vnoremap <leader>al :left<CR>
vnoremap <leader>ar :right<CR>
vnoremap <leader>ac :center<CR>

" selecting visual current line without indentation
nnoremap vv ^vg_
" create new vertical split window
nnoremap <C-n> :vnew<CR>

" resize horizontal split
noremap + <C-w>+
noremap _ <C-w>-
" resize vertical split
"nmap > <C->>
"nmap < <C-><
" go to next split
noremap <leader>w <C-w>w

" easier split naviagation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" toggle spell checking
nnoremap <leader>sd :set spell! spelllang=de<CR>
nnoremap <leader>se :set spell! spelllang=en<CR>

" better wayland clipboard support

xnoremap <silent> <C-c>:w !wl-copy<CR><CR>
noremap <C-c> :call system("wl-copy", @")<CR>
