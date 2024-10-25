
call plug#begin('~/.vim/bundle')

" Utility
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
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
Plug 'dense-analysis/ale'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'gabrielelana/vim-markdown'
Plug 'latex-box-team/latex-box'
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc' " required for deoplete
    Plug 'roxma/nvim-yarp' " required for deoplete
endif
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
" Appereance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
" Projectmanagement
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tools-life/taskwiki'
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

" ==================== fzf settings ====================

" adjust fzf to my colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment'] }


nnoremap <leader>fs :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>wo :Files ~/Documents/wiki/<CR>


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

" ==================== airline settings ====================

let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'distinguished'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#buffer_nr_show = 1 " Enable tabline to show buffer numbers
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" ==================== gundo settings =====================
let g:gundo_prefer_python3 = 1

" ==================== Language Client settings ====================
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'c':   ['ccls', '--log-file=/tmp/ccls.log'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'python':  ['/usr/bin/pyls', '--log-file=/tmp/pyls.log'],
\ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath= '/home/soeste/.vim/settings.json'
let g:LanguageClient_hasSnippetSupport = 0

" see https://github.com/MaskRay/ccls/wiki/LanguageClient-neovim
function C_init()
    " use formatexpr just for language client filetypes
    setl formatexpr=LanguageClient#textDocument_rangeFormatting()
    "set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

    " ccls specific mappings
    " caller
    nnoremap <silent> gc :call LanguageClient#findLocations({'method': '$ccls/call'})<CR>
    " callee
    nnoremap <silent> gC :call LanguageClient#findLocations({'method': '$ccls/call', 'callee':v:true})<CR>
    " member variables / variables in a namespace
    nnoremap <silent> gm :call LanguageClient#findLocations({'method': '$ccls/member'})<CR>
    " inheritance
    nnoremap <silent> gb :call LanguageClient#findLocations({'method': '$ccls/inheritance'})<CR>
endfunction

au FileType c,cpp :call C_init()

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>

nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ==================== deoplete settings ====================
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({'smart_case': v:true})

"" Disable the candidates in Comment/String syntaxes.
"call deoplete#custom#source('_',
            "\ 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#source('LanguageClient',
    \ 'min_pattern_length',
    \ 2)

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ==================== ale options ====================

let g:ale_fixers = {'python': ['isort']}


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
let g:vimwiki_list = [{'path': '~/Documents/wiki/'},]
set vimwiki-option-auto_tags
