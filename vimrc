" ~/.vimrc for configure the vim-terminal-editor

"
" Basics
"

" be IMproved
set nocompatible
" utf-8
set encoding=utf-8
" indent handling
set autoindent
" 80 character textwidth
set textwidth=80
" enable 256 colors
set t_Co=256

set backspace=indent,eol,start
" spaces instead of tabs
set noexpandtab
" 4 spaces for each tab
set tabstop=4
" 4 spaces for indentation
set shiftwidth=4
" indicates a fast terminal connection
set ttyfast

set shiftround
set matchpairs+=<:>
" show command which is being typed
set showcmd
" show my current mode
set showmode

set showmatch
" which directory to use for the file browser
set browsedir=buffer

" show current position
set ruler
" insert spaces after punctuation when using join commands
set nojoinspaces

set cpo+=$
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

" search options
" ignore case for search commands
set smartcase
" highlight whitespaces
set list
set listchars=tab:▸\ ,extends:#,nbsp:.,trail:.

let mojo_highlight_data = 1

" hide mouse while typing
set mousehide
" enabling mouse in text terminal
set mouse=a
" no noise
set noerrorbells
" tab completion
set wildmenu
set wildmode=longest:full
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

" activate omni completion, set completion function
set omnifunc=syntaxcomplete#Complete

" call pathogen to load my plugins
call pathogen#infect()

" highlight active line
set cursorline
" set max tab number
set tabpagemax=100

" customize my tabline
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " show the tabnumber to navigat with <n>gt
        let s .= ' '. (i + 1) . ' '

        " the label is made by MyTabLabel()
        let s .= '%{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let string = fnamemodify(bufname(buflist[winnr -1]), ':t')
    return empty(string) ? '[unnamed]' : string
endfunction

set tabline=%!MyTabLine()

" loading template with according file ending in new buffer
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

colorscheme mydante

" older maps
map <F11> i#! /bin/bash<ESC>o
map <F12> i#! /usr/bin/perl<ESC>o

map <F10> :noh<CR>
" toggle options
let mapleader = ','
vmap <leader>f :! ~/.bin/postfix_toggle.pl<CR>
noremap <leader>, :NERDTreeToggle<CR>

let NERDTreeWinPos = 'right'
let NERDTreeDirArrows = 1
let NERDTreeCascadeOpenSingelChildDir = 1

" show whitespace at end of line
hi ExtraWhitespace ctermbg=gray guibg=red
hi ExtraWhitespace2 ctermbg=gray guibg=red
match ExtraWhitespace /^\t*\zs \+/
match ExtraWhitespace2 /\s\+$\| \+\ze\t/

" include visual line marking 80 characters
if v:version >= 703
    set colorcolumn=80
    nmap <F4> :if &colorcolumn == 80<Bar>set colorcolumn=0<Bar>else<Bar>set colorcolumn=80<Bar>endif<CR>
endif

" toggle tabline
nmap <F6> :if &showtabline == 1<Bar>set showtabline=0<Bar>else<Bar>set showtabline=1<Bar>endif<CR>
" toggle linenumbers
nmap <F5> :set number!<CR>
" toggle cursorline
nmap <F3> :set cursorline!<CR>
nmap <F7> :call Prove()<CR>
nmap <F8> :call Compile()<CR>
map <C-h> :new %:p:r.h

" resize horizontal split
nmap + <C-w>+
nmap _ <C-w>-
" resize vertical split
"nmap > <C->>
"nmap < <C-><
" go to next split
nmap <leader>w <C-w>w

"setting tagbar
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_indent = 1
let g:tagbar_singleklick = 1
nmap <leader>t :TagbarToggle<CR>
" nmap <leader>t :TlistToggle<CR>
" nmap <leader>n :tabnext<CR>
" nmap <leader>p :tabprev<CR>

" easier split naviagation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" toggle spell checking
nmap <leader>sd :set spell! spelllang=de<CR>
nmap <leader>se :set spell! spelllang=en<CR>
nnoremap <leader>l :FufFile <CR>
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>ft :FufTag<CR>


iab dp use Data::Printer;

" toggle CursorLineNr highliting
autocmd InsertEnter * hi CursorLineNr ctermbg=24 ctermfg=15 guifg=#FFFFFF guibg=#046491
autocmd InsertLeave * hi CursorLineNr ctermbg=238 ctermfg=154 guifg=#81C725 guibg=#7C7C7C

" save last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <=  line("$") | exe "normal! g'\"" | endif

" close vim if nerdtree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" execute perl test from the editor
function! Prove()
    if ! exists("testfile")
        let testfile = "t/*.t"
    endif
    let s:params = "-lrc -v"
    execute "!prove --timer " . s:params . " " . testfile
endfunction

" call the perl interpreter from the editor
function! Compile()
    let compilefile = expand("%")
    execute "!perl -c -Ilib " . compilefile
endfunction

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

amenu Sessions.&Delete :call DeleteSession()<CR>
" disable cursorline if current file ist *.tex
autocmd BufEnter *.tex set nocursorline
autocmd BufEnter *.t set filetype=perl
autocmd BufEnter *.json set filetype=javascript

filetyp plugin on
filetyp indent on
syntax enable
