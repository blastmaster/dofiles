#! /bin/bash


target=$( echo -e  "$(tmux ls)\nnew session" |
    dmenu -nb '#000' -nf '#ff7c00' -sf '#3cff00' -sb '#000' -l 14 |
    awk -F':' '{print $1}' )
if [[ $target == "new session" ]]; then
    exec urxvt -e bash -c "source ~/.bin/tmuxsession.sh; new_session"
else
    exec urxvt -e bash -c "source ~/.bin/tmuxsession.sh; attach_session $target"
fi
