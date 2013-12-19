#! /bin/bash

# collection of functions to manage tmux sessions with dmenu

function new_session()
{
    local i=1
    if [[ ! -z $1 ]]; then
        tmux new-session -s $1
        return 0
    fi
    local sname=$(new_session_name)
    tmux new-session -s $sname
}

# building a new session name
function new_session_name()
{
    local i=1
    declare -a slist=( $(tmux ls -F '#{session_name}') )
    declare -i len=${#slist[@]:-2}

    if ! tmux has-session -t 0x0$i 2>/dev/null; then
        echo "0x0$i"
        return
    fi
    for session in ${slist[@]}; do
        if [[ $session == 0x?? ]]; then
            let i=i+1
            if ! tmux has-session -t 0x0$i 2>/dev/null; then
               echo "0x0$i"
               return
            fi
        fi
    done
}

# dumping sate of a tmux session
# dump contains currently running application and current working directory
function dump_session()
{
    local session_name=$1
    local delim=$':'
    if tmux has-session -t $session_name; then
        tmux list-windows -F "#W${delim}#{pane_current_path}" -t ${session_name}
    fi
}

# write state of a given tmux session in a sav file
function save_session()
{
    local session_name=${1:?"${FUNCNAME[0]} session name is required"}
    local session_dir=${2:?"${FUNCNAME[0]} directory where sessions saved is required"}
    if [[ -d $session_dir ]]; then
        (dump_session $session_name)> "$session_dir/${session_name}.sav"
    else
        echo "${FUNCNAME[0]} No such directory $session_dir"
    fi
}

# reload session state from file, build tmux session and attach them
# session cannot be reload if they is already active
# if the session is active they should be attached instead of reloaded
function reload_session()
{
    local session_name=${1:?"${FUNCNAME[0]} session name required"}
    local session_dir=${2:?"${FUNCNAME[0]} directory where sessions saved required"}
    local OLDIFS=${IFS}
    if tmux has-session -t $session_name 2>/dev/null; then
        attach_session $session_name $session_dir
        return
    fi
    if [[ -d $session_dir ]]; then
        while IFS=$':' read application path; do
            if ! tmux has-session -t $session_name 2>/dev/null; then
                tmux new-session -d -s  $session_name
            fi
            tmux new-window -a -c $path "$application"
        done < "$session_dir/${session_name}.sav"
    else
        echo "${FUNCNAME[0]} No such directory $session_dir"
    fi
    tmux attach -t $session_name
    IFS=${OLDIFS}
}

function attach_session()
{
    local session_name=${1:?"${FUNCNAME[0]} session name required"}
    local savdir=${2:?"${FUNCNAME[0]} directory of saved session required"}
    local newsession=$3
    OLDIFS=${IFS}
    IFS=$'\x0a'
    if tmux has-session -t $session_name 2>/dev/null; then
        is_attached=$(is_session_attached $session_name)
        if [[ $is_attached -eq 1 ]]; then
            attach_attached_session $session_name $newsession
        else
            tmux attach-session -t $session_name
        fi
    else
        reload_session $session_name $savdir
    fi
    IFS=${OLDIFS}
}

# check if given session is already anywhere attached or not
function is_session_attached()
{
    local session_name=${1:?"${FUNCNAME[0]} no session name given"}
    local delim=$":"
    tmux ls -F "#{session_name}${delim}#{session_attached}" | grep "^$session_name" | cut -d"$delim" -f2
}

# getting all names of sessions for that exists an .sav file
function get_saved_sessions()
{
    local savdir=$1
    declare -a savedsessions=( $( find $savdir -name "*.sav" ) )
    savedsessions=( ${savedsessions[@]##*/} )
    echo ${savedsessions[@]%.sav}
}


# function to attach one session from multiple clients
function attach_attached_session()
{
    local basesession=$1
    local newsession=${2:-$(new_session_name)}

    tmux new-session -d -t $basesession -s $newsession
    tmux new-window
    tmux attach-session -t $newsession \; set-option destroy-unattached
}

# create complete session list, containing saved sessions and activ ones
function get_selection_list()
{
    echo  `get_saved_sessions` | tr ' ' '\n' && tmux ls
}

# choosing a session from a dmenu selection to attach them
function choose_session()
{
    local savdir=$1
    IFS=$'\n'
    local target=$( get_selection_list |
        dmenu -nb '#000' -nf '#ff7c00' -sf '#000' -sb '#3cff00' | awk -F':' '{print $1}')
    attach_session $target $savdir
}
