#! /bin/bash


target=$(tmux ls |
    dmenu -nb '#000' -nf '#ff7c00' -sf '#000' -sb '#3cff00' -l 14 |
    awk -F':' '{print $1}' )
exec urxvt -e bash -c "source ~/.bin/tmuxsession.sh; attach_session $target"
