#! /bin/bash

# script to manage my tmux session

# sname=${1:-$(echo $(tmux ls) |cut -d" " -f1)}
# echo "sname = $sname"
# echo $(tmux ls) |cut -d" " -f1

# declare a default session name which is easy to increment
default_sname="0x01"

# for i in {0..4};do 
#     default_sname="0x0$(($default_sname+1))"
#     echo $default_sname
# done

# works with defaults less then 10
function new_session()
{
    local i=1
    if [[ $1 ]]; then
        tmux new-session -s $1
        return 0
    fi
    for session in $(tmux ls -F '#{session_name}'); do
        if [[ $session == 0x?? ]]; then
            let i=i+1
            if ! tmux has-session -t 0x0$i 2>/dev/null; then
                tmux new-session -s 0x0$i
                break
            fi
            continue
        fi
    done
}

# target=$(tmux ls | dmenu -nb '#000' -nf '#ff7c00' -sf '#000' -sb '#3cff00' -l 14 | awk -F':' '{print $1}' )
# tmux attach-session -t $target

function attach_session()
{
    local session_name=$1
    local newsession=$2
    echo $session_name

    OLDIFS=${IFS}
    IFS=$'\x0a'
    declare -a list=( $(tmux ls -F '#{session_name}') )
    declare -a attachedlist=( $(tmux ls -F '#{session_attached}') )
    local len=${#list[@]}
    for (( i=0; i < $len; i++ )); do
        if [[ $session_name == ${list[$i]} ]]; then
            if [[ ${attachedlist[$i]} -eq 1 ]]; then
                attach_attached_session $session_name #$newsession
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
    local newsession="test"

    tmux new-session -d -t $basesession -s $newsession
    tmux new-window
    tmux attach-session -t $newsession \; set-option destroy-unattached
}


# starting default session if no session is already running
if ! tmux -q has-session; then
    new_session $1
else
    while getopts a:n opt; do
        case $opt in
            a) shift; attach_session "$@";;
            n) shift; new_session "$@";;
        esac
    done
fi
