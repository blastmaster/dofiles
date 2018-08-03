
call vundle#begin()

" Utility
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
" Development
Plugin 'majutsushi/tagbar'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'autozimu/LanguageClient-neovim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'gabrielelana/vim-markdown'
Plugin 'latex-box-team/latex-box'
" Appereance
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
" Projectmanagement
Plugin 'vimwiki/vimwiki'
Plugin 'tbabej/taskwiki'
Plugin 'mattn/calendar-vim'

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

" gruvbox settings
let g:gruvbox_contrast_dark = 'medium'

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
"nnoremap <leader>gd :YcmCompleter GoTo<CR>

"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_global_ycm_extra_conf = ''
"let g:ycm_extra_conf_globlist = [ '~/dev/*' ]
" gundo settings
let g:gundo_prefer_python3 = 1

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['/opt/cquery/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'c':   ['/opt/cquery/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'python':  ['/home/soeste/.local/bin/pyls', '--log-file=/tmp/pyls.log'],
\ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath= '/home/soeste/.vim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
