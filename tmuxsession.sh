#! /bin/bash

# script to manage my tmux session


# declare a default session name which is easy to increment
default_sname="0x01"

# declaring some global variables
# a list of all sessions
# the length of the list
declare -a slist=( $(tmux ls -F '#{session_name}') )
declare -i len=${#slist[@]}

# works with defaults less then 10
function new_session()
{
    local i=1
    if [[ $1 ]]; then
        tmux new-session -s $1
        return 0
    fi
    local sname=$(new_session_name)
    tmux new-session -s $sname
}

function new_session_name()
{
    local i=1
    for session in ${slist[@]}; do
        if [[ $session == 0x?? ]]; then
            let i=i+1
            if ! tmux has-session -t 0x0$i 2>/dev/null; then
               echo "0x0$i"
            fi
        fi
    done
}

function attach_session()
{
    local session_name=$1
    local newsession=$2

    OLDIFS=${IFS}
    IFS=$'\x0a'
    declare -a attachedlist=( $(tmux ls -F '#{session_attached}') )
    for (( i=0; i < $len; i++ )); do
        if [[ $session_name == ${slist[$i]} ]]; then
            if [[ ${attachedlist[$i]} -eq 1 ]]; then
                attach_attached_session $session_name $newsession
            else
                tmux attach-session -t $session_name
            fi
        fi
    done
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

function choose_session()
{
    local target=$(tmux ls |
        dmenu -nb '#000' -nf '#ff7c00' -sf '#000' -sb '#3cff00' -l $len |
        awk -F':' '{print $1}' )
    attach_session $target
}

if ! tmux -q has-session; then
    new_session $1
else
    while getopts a:nc opt; do
        case $opt in
            a) shift; attach_session "$@";;
            n) shift; new_session "$@";;
            c) choose_session;;
        esac
    done
fi
