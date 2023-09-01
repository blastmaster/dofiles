
# Cache
zsh_cache=~/.zsh/cache
mkdir -p $zsh_cache

if [ -e /home/soeste/.nix-profile/etc/profile.d/nix.sh ]; then 
    . /home/soeste/.nix-profile/etc/profile.d/nix.sh;
fi

# Use modern completion system
autoload -Uz compinit zrecompile

if [ $UID -eq 0 ]; then :
else
    #compinit -d $zsh_cache/zcomp-$HOST

    for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
        zrecompile -qp $f && rm -f $f.zwc.old
    done

fi

setopt extended_glob

## Completion
autoload colors; colors;

zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle -e ':autocomplete:*' list-lines 'reply=( $(( LINES / 3 )) )'
zstyle ':completion:*:paths' path-completion yes
if [[ -n $commands[lsd] ]]; then
    if [[ -n $commands[vivid] ]]; then
        export LS_COLORS="$(vivid generate molokai)"
    elif [[ -x dircolors ]]; then
        eval "'dircolors'"
        export LS_COLORS="*.ogm=01;35:${LS_COLORS}"
        export ZLS_COLORS=$LS_COLORS
    fi
    alias ls="lsd --classify --date=relative"
fi

if [ x"$HOME" = x ] ; then
        export HOME=$(cd ~ ; pwd)
fi

if [ x"$HOSTNAME" = x ] ; then
        export HOSTNAME=$(hostname)
fi

export MANWIDTH=80
export EDITOR=vim
export RLWRAP_HOME=~/.cache/rlwrap/
export LC_MESSAGES=C.UTF-8
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.data
export XDG_DESKTOP_DIR="${HOME}/Desktop"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_MUSIC_DIR="${HOME}/Music"
export XDG_PICUTRES_DIR="${HOME}/Pictures"
export XDG_PUBLICSHARE_DIR="${HOME}/Public"
export XDG_TEMPLATES_DIR="${HOME}/Templates"
export XDG_VIDEOS_DIR="${HOME}/Videos"

# detect chroot
# This does not work my inode of / is greater than 2.
#[[ `stat -c %i /` -ne 2 ]] && export CHROOT=yes

# path junk

if [ $UID -eq 0 ]; then
        PATH=~root/bin:$PATH
else
        PATH=${HOME}/.local/bin:${HOME}/go/bin:${PATH}:/opt/scripts/bin
fi

PATH=${PATH}:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/games

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# this makes man pages look nicer...
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export PAGER=less
export VPAGER="vim -R -"

# source other settings, prompt, completion, zshopts, ...
for zshrc_snipplet in ~/.zsh/rc/S[0-9][0-9]*[^~] ; do
    source $zshrc_snipplet
done

# ALIASES

alias du="du -hcs"
alias df="df -h"

#alias l="ls --color=always -CAF"
#alias ls="ls --color=always"
#alias la="ls -la"
#alias ll='ls --color=always -lhAtrc'
#alias ltr="ls -ltr"
#alias lsfc="ls -A1|wc -l"

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

alias svim="sudo HOME=/home/blastmaster vim -u /home/blastmaster/.vimrc"
alias snvim="sudo HOME=/home/blastmaster nvim -u /home/blastmaster/.config/nvim/init.vim"
alias powertop="sudo powertop"

alias e="exit"
alias :q="exit"

alias cp='cp -v'

alias nv='nvim'
alias wiki='vim -c :VimwikiIndex'

# debain depended aliases
if [[ -f /etc/debian_version ]]; then
    alias debs-by-size="dpkg-query -Wf 'x \${Installed-Size} \${Package} \${Status}\n' | sed -ne '/^x  /d' -e '/^x \(.*\) install ok installed$/s//\1/p' | sort -nr"
    alias bat=batcat
fi

# who was logged in and how often
alias laststats="last|sed 's/ .*//'|sort|uniq -c|sort -nr|less"

# HASHES
# system stuff
hash -d deb=/var/cache/apt/archives
hash -d doc=/usr/share/doc
hash -d linux=/lib/modules/$(uname -r)/build/
hash -d log=/var/log

hash -d license=/usr/share/common-licenses

# coding stuff
hash -d dev=/home/soeste/development

# useful functions

# search for a file
ff() { /usr/bin/find . -iname "*$@*" 2>/dev/null }
# open file in browser
browse() { $BROWSER file://"$(pwd)/$1" }
# backup
bak() { cp -a "$1" "${1}_$(date --iso-8601=seconds)" }
# go to doc directory $1 is a pkg-name
doc() { cd /usr/share/doc/$1 }
# lock screen
lock() { i3lock -t -i ~/Pictures/prometheus.png }
# function for suspending computer, but suspend is a shell builtin?!??
#suspend() {
    #sudo echo "suspending _" && (sudo acpitool -s & xtrlock)
#}

function urlencode() {
    python3 -c "import sys, urllib.parse as parse; print(parse.quote(sys.argv[1]))" $1;
}

function urldecode() {
    python3 -c "import sys, urllib.parse as parse; print(parse.quote(sys.argv[1]))" $1;
}

youtube-mplayer() {
    COOKIE_FILE=/tmp/youtube-dl-cookies.txt
    mpv -cache 9999 -cookies -cookies-file ${COOKIE_FILE} $(youtube-dl -g --cookies ${COOKIE_FILE} $*)
}

own() {
    if [ -n "${commands[sudo]}" ]; then
            sudo chown -R "$USER:$(id -gn)" "$@"
    else
            chown -R "$USER:$(id -gn)" "$@"
    fi
}

# Clone a git repository, cd into that repository.
# Execute tokei to get some statistics.
clone()
{
    git clone "${1:?"usage: clone <GIT_CLONE_URL>"}"
    cd ${${1%%.git}##*/}
    if [ -n "${commands[tokei]}" ]; then
        tokei
    fi
}

# Build cscope database in current directory.
build_cscope_db()
{
    find ${PWD} -type f -name "*.c" \
        -o -name "*.cc" \
        -o -name "*.cpp" \
        -o -name "*.h" \
        -o -name "*.hpp" \
        -o -name "*.H" > ${PWD}/cscope.files
    cscope -R -b
    export CSCOPE_DB=${PWD}/cscope.out
}

alias csbuild=build_cscope_db

# Export CSCOPE_DB environment variable set to ${PWD}/cscope.out
export_cscope_db()
{
    export CSCOPE_DB=${PWD}/cscope.out
}

alias csexport=export_cscope_db

# apt-get install libapp-nopaste-perl
gist() { nopaste --service Gist "$@" }

# debian related functions
if [[ -f /etc/debian_version ]]; then
    # View Debian changelog of a given Package
    dchange()
    {
        emulate -L zsh
        local pkg=${1:?"no package name given"}
        if [[ -r /usr/share/doc/$pkg/changelog.Debian.gz ]]; then
            $PAGER /usr/share/doc/$pkg/changelog.Debian.gz
        elif [[ -r /usr/share/doc/$pkg/changelog.gz ]]; then
            $PAGER /usr/share/doc/$pkg/changelog.gz
        else
            aptitude changelog $pkg
        fi
    }

    # View Debian NEWS of a given package
    dnews()
    {
        emulate -L zsh
        local pkg=${1:?"no package name given"}
        if [[ -r /usr/share/doc/$pkg/NEWS.Debian.gz ]]; then
            $PAGER /usr/share/doc/$pkg/NEWS.Debian.gz
        elif [[ -r /usr/share/doc/$pkg/NEWS.gz ]]; then
            $PAGER /usr/share/doc/$pkg/NEWS.gz
        else
            echo "No NEWS file for package $pkg found"
        fi
    }

    # View Debian copyright of a given package
    dcopyright()
    {
        emulate -L zsh
        local pkg=${1:?"no package name given"}
        if [[ -r /usr/share/doc/$pkg/copyright ]]; then
            $PAGER /usr/share/doc/$pkg/copyright
        else
            echo "No copyright file for package $pkg found"
        fi
    }
fi

compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# search command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf-tmux -d --no-sort --tac | sed 's/ *[0-9]* *//')
}

# search for tmux-sessions
tm() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf-tmux -d -q "$*" --select-1 --exit-0)
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    [[ -n "$session" ]] && tmux $change -t $session || tmux
}

# search .viminfo history
vh() {
  local files
  files=$(grep --color=never '^>' ~/.viminfo | cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && cd ${${files//\~/$HOME}%/*}; vim ${files//\~/$HOME}
}

# search vim-wiki files in ~/vimwiki/*.wiki
vw() {
    local wikipages
    IFS=$'\n' wikipages=( \
        $(find ~/vimwiki -type f -not -path "*.git/*" -and -name "*.wiki" | \
        fzf-tmux -d -m -q "$*" --select-1 --exit-0) \
    )
    [[ -n "$wikipages" ]] && ${EDITOR:-vim} "${wikipages[@]}"
}

if [[ -f /etc/debian_version ]]; then
    # apt search and show using fzf, select multiple packages is supported
    acs() {
        local packages
        packages=( \
            $(apt-cache search "$*" | fzf-tmux -m -d -q "$*" --select-1 --exit-0 | cut -d" " -f1) \
        )
        [[ -n "$packages" ]] && apt-cache show "${packages[@]}"
    }

    # apt search and policy using fzf, select multiple packages is supported
    acp() {
        local packages
        packages=( \
            $(apt-cache search "$*" | fzf-tmux -m -d -q "$*" --select-1 --exit-0 | cut -d" " -f1) \
        )
        [[ -n "$packages" ]] && apt-cache policy "${packages[@]}"
    }

    # apt search and install using fzf, select multiple packages is supported
    asi() {
        local packages=( \
            $(apt-cache search "$*" | fzf-tmux -m -d -q "$*" --select-1 --exit-0 | cut -d" " -f1) \
        )
        [[ -n "$packages" ]] && sudo apt install "${packages[@]}"
    }
fi
# https://github.com/zdharma-continuum/fast-syntax-highlighting.git
[[ -f ~/code/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]] && source ~/code/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

