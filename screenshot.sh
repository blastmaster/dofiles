#! /usr/bin/env bash

# Just create a screenshot of the current screen and place it under
# ~/Pictures/screenshots name is the number of seconds since 1970.


[[ -d ~/Pictures/screenshots ]] || mkdir -p ~/Pictures/screenshots
maim ~/Pictures/screenshots/$(date +%s).png
