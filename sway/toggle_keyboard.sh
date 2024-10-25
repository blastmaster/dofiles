#! /bin/bash

if [[ "$(swaymsg -r -t get_inputs | jq '.[].xkb_active_layout_name|strings' | uniq)" =~ "US" ]]; then
    swaymsg input type:keyboard xkb_layout "de" 
else
    swaymsg input type:keyboard xkb_layout "us"
fi
