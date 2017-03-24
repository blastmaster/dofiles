
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'gabrielelana/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'latex-box-team/latex-box'

call vundle#end()

"NERDCommenter settings
nnoremap <leader>cc :NERDComComment
nnoremap <leader>cu :NERDComUncommentLine
nnoremap <leader>ci :NERDComInvertComment
nnoremap <leader>cA :NERDComAppendComment
nnoremap <leader>cs :NERDComSexyComment

" vim-markdown settings
" conceal italics, bold, inline code and links
let g:markdown_enable_conceal = 1

" CtrlP settings
let g:ctrlp_map = '<leader>fs'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_by_filename = 1                 " search for filenames instead of full paths
let g:ctrlp_tabpage_position = 'ac'         " open tab after the current one
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRU<CR>
nnoremap <leader>tb :CtrlPBufTag<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<F2>"
"let g:UltiSnipsListSnippet= '<c-tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ack.vim
" using ag silver searcher if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" searching lefthand word with ack.vim
nnoremap <leader>a :LAck<CR>

" GitGutter settings
nnoremap <leader>gg :GitGutterToggle<CR>

" NerdTree settings
nnoremap <leader>\ :NERDTreeToggle<CR>
let NERDTreeWinPos = 'right'
let NERDTreeDirArrows = 1
let NERDTreeCascadeOpenSingelChildDir = 1
let NERDTreeIgnore = ['\.s\?o$[[file]]', '\.a[[file]]$', '\.pyc[[file]]']

" tagbar settings
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_indent = 1
let g:tagbar_singleklick = 1
nnoremap <leader>t :TagbarToggle<CR>

" YouCompleteMe setttings {{{
nnoremap <leader>gd :YcmCompleter GoTo<CR>

let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_global_ycm_extra_conf = ''
"let g:ycm_extra_conf_globlist = [ '~/dev/*' ]

" }}}

" syntastic syntax
let syntastic_enable_signs = 1
highlight SyntasticError        ctermfg=197 ctermbg=233
highlight SyntasticWarning      ctermfg=220 ctermbg=233
highlight SyntasticErrorSign    ctermfg=197 ctermbg=233
highlight SyntasticErrorLine    ctermfg=118 ctermbg=233
highlight SyntasticWarningLine  ctermfg=118 ctermbg=233
highlight SyntasticStyleError   ctermfg=197 ctermbg=233
highlight SyntasticStyleWarning ctermfg=118 ctermbg=233