
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
" jumb to bracket if one is inserted
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
"let g:tex_flavor="pdftex"
" be case insensetive
set ignorecase

set autowrite	" write contents of the file if it has been modified
set autoread	" read contents of the file if it has been modified out side of vim
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
set wildignore+=.git,.svn,.hg                       " Version Control
set wildignore+=*.aux,*.toc,*.toc                   " LateX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " Binary images
set wildignore+=*.o,*.so,*.class                    " compiled object files

" timeouts
" timeout only for for keycodes after 10 milliseconds
set notimeout
set ttimeout
set ttimeoutlen=10

" backups
set nobackup
" it's the 21th century, we use version control for this
set noswapfile

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
function! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
   if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

set foldlevelstart=1    " start with open folds
set foldmethod=indent
set foldnestmax=2
set foldtext=CustomFoldText()
