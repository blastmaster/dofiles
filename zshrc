
# Cache
zsh_cache=~/.zsh/cache
mkdir -p $zsh_cache

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

if [ x"$HOME" = x ] ; then
        export HOME=$(cd ~ ; pwd)
fi

if [ x"$HOSTNAME" = x ] ; then
        export HOSTNAME=$(hostname)
fi

export MANWIDTH=80
export EDITOR=vim
export RLWRAP_HOME=~/.cache/rlwrap/
export LC_MESSAGES=C
export LC_ALL=C

# detect chroot
[[ `stat -c %i /` -ne 2 ]] && export CHROOT=yes

# path junk

if [ $UID -eq 0 ]; then
        PATH=~root/bin:$PATH
else
        path=(${HOME}/.bin:${HOME}/.local/bin:${HOME}/development/go/bin  $path)
fi

path=($path /bin:/usr/bin /usr/local/bin /sbin:/usr/sbin /usr/local/sbin /usr/games)

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

alias l="ls --color=always -CAF"
alias ls="ls --color=always"
alias la="ls -la"
alias ll='ls --color=always -lhAtrc'
alias ltr="ls -ltr"
alias lsfc="ls -A1|wc -l"

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

# debain depended aliases
if [[ -f /etc/debian_version ]]; then
    alias acs="apt search"
    alias acp="apt-cache policy"
    alias ai="sudo apt install"
    alias au="sudo apt update"
    alias agu="sudo apt upgrade"

    # list installed packages sorted by size
    alias debs-by-size="dpkg-query -Wf 'x \${Installed-Size} \${Package} \${Status}\n' | sed -ne '/^x  /d' -e '/^x \(.*\) install ok installed$/s//\1/p' | sort -nr"
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
hash -d dev=/home/blastmaster/development

# load modules environment
if [[ -f /usr/share/modules/init/zsh ]]; then
    source  /usr/share/modules/init/zsh
fi

# load perlbrew
if [[ -f ${HOME}/perl5/perlbrew/etc/bashrc ]]; then
    source ${HOME}/perl5/perlbrew/etc/bashrc
fi

ff() { /usr/bin/find . -iname "*$@*" 2>/dev/null }
browse() { $BROWSER file://"$(pwd)/$1" }
bak() { cp -a "$1" "${1}_$(date --iso-8601=seconds)" }
doc() { cd /usr/share/doc/$1 }
# function for suspending computer, but suspend is a shell builtin?!??
#suspend() {
    #sudo echo "suspending _" && (sudo acpitool -s & xtrlock)
#}

function url-encode; {
        setopt extendedglob
        echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
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
