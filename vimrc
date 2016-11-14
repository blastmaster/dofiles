" ~/.vimrc for configure the vim-editor

"
" Basic Options ----------------------------------------------------------------
"
" be IMproved
set nocompatible

set rtp+=~/.vim/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/utl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

" utf-8
set encoding=utf-8
set fileencoding=utf-8
" indent automatically
set autoindent
" 80 character textwidth
set textwidth=80
" enable 256 colors
set t_Co=256
" don't try to highlight lines longer than 800 characters
set synmaxcol=800

set backspace=indent,eol,start
" expand tabs with spaces
set expandtab
" 4 spaces for each tab
set tabstop=4
" 4 spaces for indentation
set shiftwidth=4
" tabs that replaced with spaces behave like tabs
set softtabstop=4
" indicates a fast terminal connection
set ttyfast
" hide buffer when it is abandoned
set hidden
" set size of command and search pattern history
set history=1000
" round the indent to a multiple of shiftwidth
set shiftround
" jump between pairs with '%'
" TODO: =:; makes only sense in special filetypes
" use au FileType c,cpp,java,perl set matchpairs+==:;
set matchpairs+=<:>,=:;

" see :help fo-table for details
set formatoptions+=qrnlj

set matchtime=3
" show command which is being typed
set showcmd
" show my current mode
set showmode
" jumb to bracket if one is insetered
set showmatch
" which directory to use for the file browser (current buffer)
set browsedir=buffer

" show current position
set ruler
" insert spaces after punctuation when using join commands
set nojoinspaces
" setting vi-compatible behaivour for the $ character
set cpo+=$
" do not break lines if window to small
set nowrap
" left/right movements don't wrap
set whichwrap=""
" deactivate modlines
set modelines=0
" set linenumbers by default
set number
" highlight search
set hlsearch
" C indent
set cin
" setting program used for the :grep command
set grepprg=grep\ -nH\ $*
" latex suite option
let g:tex_flavor="pdftex"
" be case insensetive
set ignorecase

set autowrite	" write contents of the file if it has been modified
set autoread	" read contents of the fiel if it has been modified out side of vim
" search options
" ignore case for search commands
set smartcase
" highlight whitespaces
set list
set listchars=tab:▸\ ,extends:#,nbsp:.,trail:.
" NOTE: wrap is currently turned off
set showbreak=↪ " single-cell character at start of lines that have been wrapped

" set max tab number
set tabpagemax=100

" hide mouse while typing (works only in the gui version)
set mousehide
" enabling mouse in text terminal
set mouse=a
" no noise
set noerrorbells
" wildmenu completion
set wildmenu
set wildmode=longest:full
set wildignore+=.git,.svn,.hg						" Version Control
set wildignore+=*.aux,*.toc,*.toc					"LateX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg		"binary images
set wildignore+=*.o,*.so,*.class					"compiled object files

" timeouts
" timeout only for for keycodes after 10 milliseconds
set notimeout
set ttimeout
set ttimeoutlen=10

" backups
set nobackup
set noswapfile		" it's the 21th century, we use version control for this

" always show a statusline
set laststatus=2
" statusline format, see :help statusline for details
set statusline=%F%m%r%h%w\ %y%=[Buffer\:\ %n][Lines\:\ %l\/%L][Column\:\ %c][%p%%]
"set minimum distance to buttom
set scrolloff=7

" split behaivor
" open new window below the current (horizontal split)
set splitbelow
" open new window right of the current (vertical split)
set splitright
" highlight active line
set cursorline

" activate omni completion, set completion function
set omnifunc=syntaxcomplete#Complete

" Folding
set foldlevelstart=99    " start with open folds
set foldmethod=syntax
set foldnestmax=2

" customize my tabline
"function! MyTabLine()
    "let s = ''
    "for i in range(tabpagenr('$'))
        "" select the highlighting
        "if i + 1 == tabpagenr()
            "let s .= '%#TabLineSel#'
        "else
            "let s .= '%#TabLine#'
        "endif

        "" set the tab page number (for mouse clicks)
        "let s .= '%' . (i + 1) . 'T'

        "" show the tabnumber to navigat with <n>gt
        "let s .= ' '. (i + 1) . ' '

        "" the label is made by MyTabLabel()
        "let s .= '%{MyTabLabel(' . (i + 1) . ')} '
    "endfor

    "" after the last tab fill with TabLineFill and reset tab page nr
    "let s .= '%#TabLineFill#%T'

    "return s
"endfunction

"function! MyTabLabel(n)
    "let buflist = tabpagebuflist(a:n)
    "let winnr = tabpagewinnr(a:n)
    "let string = fnamemodify(bufname(buflist[winnr -1]), ':t')
    "return empty(string) ? '[unnamed]' : string
"endfunction

"set tabline=%!MyTabLine()

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

" loading template with according file ending in new buffer
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

"colorscheme codecolors
colorscheme distinguished

" start console vim with dark and gui with light colorscheme by default
if (! has('gui_running'))
    let &background = 'dark'
    let g:airline_theme = 'murmur'
else
    let &background = 'light'
    let g:airline_theme = 'sol'
endif

function! ToggleTheme()
    if &background == 'dark'
        let &background = 'light'
        let g:airline_theme = 'sol'
    else
        let &background = 'dark'
        let g:airline_theme = 'murmur'
    endif
endfunction

" Mappings ---------------------------------------------------------------------

" setting leader keys
let mapleader = '\'
let maplocalleader = ','

" older maps
" TODO: register just one key for each filetype use /usr/bin/env interpreter
noremap <F11> i#! /bin/bash<ESC>o
noremap <F12> i#! /usr/bin/perl<ESC>o
noremap <F10> :noh<CR> " turn off search highlighting
"noremap <F9> :if &background == 'dark'  <Bar> let &background = 'light' <Bar> else <Bar> let &background = 'dark' <Bar> endif<CR>
noremap <F9> :call ToggleTheme()<CR>

" editing vimrc file quickly
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" open a new tab
nnoremap <C-t> :tabnew<CR>

" insert a line of '-' dashes
" TODO: can we use textwidth instead of setting the 80 character hardcoded?
nnoremap <leader>ml 80i-<Esc>

" setting corresponding paranthesis automatica and set cursor inside
" TODO: These mappings should only happens in code files
inoremap ( ()<Left>
inoremap [ []<Left>
" imap { {<CR><CR>}<UP>

" when jumping between matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap n nzz
" nnoremap N Nzz

" same when jumping through changelist
nnoremap g; g;zz
nnoremap g, g,zz

" Sort lines
nnoremap <leader>s vip:!sort<CR>
vnoremap <leader>s :!sort<CR>

" uppercase
inoremap <c-u> <esc>mzgUiw`za

" don't move on *
nnoremap * *<c-o>

" toggle postfix conditions in perl
vnoremap <leader>f :! ~/.bin/postfix_toggle.pl<CR>

"NERDCommenter settings
nnoremap <leader>cc :NERDComComment
nnoremap <leader>cu :NERDComUncommentLine
nnoremap <leader>ci :NERDComInvertComment
nnoremap <leader>cA :NERDComAppendComment
nnoremap <leader>cs :NERDComSexyComment

" CtrlP settings
let g:ctrlp_map = '<leader>fs'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_by_filename = 1					" search for filenames instead of full paths
let g:ctrlp_tabpage_position = 'ac'			" open tab after the current one
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fm :CtrlPMRU<CR>
nnoremap <leader>tb :CtrlPBufTag<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<F2>"
"let g:UltiSnipsListSnippet= '<c-tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" orgmode settings {{{
let g:org_todo_keywords = [ 'TODO', '|', 'PROGRESS', 'DONE' ]
let g:org_todo_keyword_faces = [['TODO', [':foreground red', ':weight bold']], ['PROGRESS', [':foreground yellow', 'weight bold']], ['DONE', [':foreground green', ':weight bold']]]
"let g:org_agenda_files = ['~/org/agenda.org']
let g:org_agenda_files = ['~/org/*.org']
" disable org indent
let g:org_indent = 0
" }}}

" utl settings {{{
" set utl media type handler for pdf
if $DISPLAY != '' || has('gui_running')
    for pdfviewer in [ 'okular', 'zathura', 'evince' ]
        let pdfviewer = '/usr/bin/'.pdfviewer
        if filereadable(pdfviewer)
            let g:utl_cfg_hdl_mt_application_pdf = 'silent! '.pdfviewer.' "%p" &'
            break
        endif
    endfor
endif
"}}}

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

" clear trailing whitespaces
nnoremap <leader>. :%s/\s\+$//<CR>:let @/=''<CR>

" align text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>
vnoremap <leader>al :left<CR>
vnoremap <leader>ar :right<CR>
vnoremap <leader>ac :center<CR>

" selecting visual current line without indentation
nnoremap vv ^vg_

" show whitespace at end of line
hi ExtraWhitespace ctermbg=gray guibg=red
hi ExtraWhitespace2 ctermbg=gray guibg=red
match ExtraWhitespace /^\t*\zs \+/
match ExtraWhitespace2 /\s\+$\| \+\ze\t/

" include visual line marking 100 characters
if v:version >= 703
    set colorcolumn=100
    nnoremap <F4> :if &colorcolumn == 100<Bar>set colorcolumn=0<Bar>else<Bar>set colorcolumn=100<Bar>endif<CR>
endif

" toggle tabline
noremap <F6> :if &showtabline == 1<Bar>set showtabline=0<Bar>else<Bar>set showtabline=1<Bar>endif<CR>
" toggle linenumbers
noremap <F5> :set number!<CR>
" toggle cursorline
nnoremap <F3> :set cursorline!<CR>
nnoremap <F7> :call Prove()<CR>
" nmap <F8> :call Compile()<CR>
nnoremap <C-h> :new %:p:r.h

" resize horizontal split
noremap + <C-w>+
noremap _ <C-w>-
" resize vertical split
"nmap > <C->>
"nmap < <C-><
" go to next split
noremap <leader>w <C-w>w

" noremap <leader>t :TlistToggle<CR>

" easier split naviagation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" toggle spell checking
nnoremap <leader>sd :set spell! spelllang=de<CR>
nnoremap <leader>se :set spell! spelllang=en<CR>

" Autocommands -----------------------------------------------------------------
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

" autoload and autosave sessions.

" autocmd VimEnter * call AutoLoadSession()
" autocmd VimLeave * call AutoSaveSession()

function! AutoLoadSession()
     if argc() == 0
        perl << EOD
        use Digest::MD5 qw(md5_hex);
        use Cwd;
        my $session_md5_hash = md5_hex(cwd());
        VIM::Msg($session_md5_hash);
        my $session_path = "$ENV{HOME}/.vim/sessions/$session_md5_hash.session";
        if ( -e $session_path ) {
            VIM::DoCommand
            (
            "silent source $session_path"
            );
        }
EOD
    else
        perl << EOD
        use Digest::MD5 qw(md5_hex);
        use Cwd;
        my ($ret, $filename) = VIM::Eval("expand('%')");
        VIM::Msg($filename);
        $filename .= "_";
        $filename .= cwd();
        my $session_md5_hash = md5_hex($filename);
        my $session_path = "$ENV{HOME}/.vim/sessions/$session_md5_hash.session";
        if ( -e $session_path ) {
            VIM::DoCommand
            (
            "silent source $session_path"
            );
        }
EOD
    endif
endfunction

function! AutoSaveSession()
    if argc() == 0
        perl << EOD
        use Digest::MD5 qw(md5_hex);
        use Cwd;
        my $session_md5_hash = md5_hex(cwd());
        my $session_path = "$ENV{HOME}/.vim/sessions/$session_md5_hash.session";
        VIM::DoCommand
        (
        "silent mksession! $session_path"
        );
EOD
    else
        perl << EOD
        use Digest::MD5 qw(md5_hex);
        use Cwd;
        my $filename = VIM::Eval("expand('%')");
        $filename .= "_";
        $filename .= cwd();
        my $session_md5_hash = md5_hex($filename);
        VIM::Msg($filename);
        my $session_path = "$ENV{HOME}/.vim/sessions/$session_md5_hash.session";
        VIM::DoCommand
        (
        "silent mksession! $session_path"
        );
EOD
    endif
endfunction

function! DeleteSession()
    if argc() == 0
        perl << EOD
        use Digest::MD5 qw(md5_hex);
        use Cwd;
        my $session_md5_hash = md5_hex(cwd());
        my $session_path = "$ENV{HOME}/.vim/sessions/$session_md5_hash.session";
        unlink($session_path);
EOD
    endif
endfunction

" disable cursorline if current file is *.tex or *.txt
autocmd BufEnter *.tex set nocursorline
autocmd BufEnter *.txt set nocursorline
autocmd BufEnter *.t set filetype=perl
autocmd BufEnter *.json set filetype=javascript

filetyp plugin on
filetyp indent on
syntax enable
