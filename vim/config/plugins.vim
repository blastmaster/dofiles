
call plug#begin('~/.vim/bundle')

" Utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
" Development
Plug 'majutsushi/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tpope/vim-fugitive'
"Plug 'w0rp/ale'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'gabrielelana/vim-markdown'
Plug 'latex-box-team/latex-box'
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc' " required for deoplete
    Plug 'roxma/nvim-yarp' " required for deoplete
endif
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
" Appereance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
" Projectmanagement
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-startify'

call plug#end()

" ==================== NERDCommenter settings ====================
nnoremap <leader>cc :NERDComComment
nnoremap <leader>cu :NERDComUncommentLine
nnoremap <leader>ci :NERDComInvertComment
nnoremap <leader>cA :NERDComAppendComment
nnoremap <leader>cs :NERDComSexyComment

" ==================== vim-markdown settings ====================
" conceal italics, bold, inline code and links
let g:markdown_enable_conceal = 1

" ==================== gruvbox settings ====================
let g:gruvbox_contrast_dark = 'medium'

" ==================== CtrlP settings ====================
let g:ctrlp_map = '<leader>fs'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_by_filename = 1                 " search for filenames instead of full paths
let g:ctrlp_tabpage_position = 'ac'         " open tab after the current one
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRU<CR>
nnoremap <leader>tb :CtrlPBufTag<CR>

" ==================== ultisnips ====================
let g:UltiSnipsExpandTrigger="<F2>"
"let g:UltiSnipsListSnippet= '<c-tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ==================== ack.vim ====================
" using ag silver searcher if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" searching lefthand word with ack.vim
nnoremap <leader>a :LAck<CR>

" ==================== GitGutter settings ====================
nnoremap <leader>gg :GitGutterToggle<CR>

" ==================== NerdTree settings ====================
nnoremap <leader>\ :NERDTreeToggle<CR>
let NERDTreeWinPos = 'right'
let NERDTreeDirArrows = 1
let NERDTreeCascadeOpenSingelChildDir = 1
let NERDTreeIgnore = ['\.s\?o$[[file]]', '\.a[[file]]$', '\.pyc[[file]]']

" ==================== tagbar settings ====================
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_indent = 1
let g:tagbar_singleklick = 1
nnoremap <leader>t :TagbarToggle<CR>

" ==================== gundo settings ====================
let g:gundo_prefer_python3 = 1

" ==================== Language Client settings ====================
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'c':   ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'python':  ['pyls'],
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

" ==================== deoplete settings ====================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

"" Disable the candidates in Comment/String syntaxes.
"call deoplete#custom#source('_',
            "\ 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#source('LanguageClient',
    \ 'min_pattern_length',
    \ 2)

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ==================== startify options ====================

" save my sessions persistent
let g:startify_session_persistence = 1
" When opening a file change to VCS root if there is one.
let g:startify_change_to_vcs_root = 1
" setting startify bookmarks
let g:startify_bookmarks = [
    \ '~/.vimrc',
    \ '~/.zshrc'
    \ ]

" create a new session
nnoremap <leader>ss :SSave

" ==================== vimwiki options ====================

let g:vimwiki_hl_headers = 1 " highlight headers with color

let g:vimwiki_list = [
    \{'path': '~/Documents/wiki/private/'},
    \{'path': '~/Documents/wiki/phd/'},
    \{'path': '~/Documents/wiki/knowledge_base/'}]

