" Autocommands -----------------------------------------------------------------
" loading template with according file ending in new buffer
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template
" toggle CursorLineNr highliting in insert mode
autocmd InsertEnter * hi CursorLineNr ctermbg=24 ctermfg=15 guifg=#FFFFFF guibg=#046491
autocmd InsertLeave * hi CursorLineNr ctermbg=238 ctermfg=154 guifg=#81C725 guibg=#7C7C7C
" resize splits when window is resized
autocmd VimResized * exe "normal! \<C-W>="
" save automatically when losing focus
autocmd FocusLost * :wa
" save last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <=  line("$") | exe "normal! g'\"" | endif
" close vim if nerdtree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" file types
autocmd BufEnter *.json set filetype=javascript
