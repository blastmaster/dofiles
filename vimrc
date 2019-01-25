" ~/.vimrc for configure the vim-editor

"
" Basic Options ----------------------------------------------------------------
"
" be IMproved
set nocompatible

set rtp+=~/.vim/

filetyp plugin on
filetyp indent on
syntax enable

" setting leader keys
let mapleader = '\'
let maplocalleader = ','

" load plugins
source ~/.vim/config/plugins.vim
" load settings
source ~/.vim/config/settings.vim
" load mappings
source ~/.vim/config/mappings.vim
" load autocommands
source ~/.vim/config/autocommands.vim

"colorscheme codecolors
colorscheme PaperColor

" show whitespace at end of line
hi ExtraWhitespace ctermbg=gray guibg=red
hi ExtraWhitespace2 ctermbg=gray guibg=red
match ExtraWhitespace /^\t*\zs \+/
match ExtraWhitespace2 /\s\+$\| \+\ze\t/
