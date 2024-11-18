#! /usr/bin/env bash

# select an application and set focus
# taken from Examples in wofi(7)

swaymsg -t get_tree |
    jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else []
end + .floating_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " " + .name)' |
    wofi --show dmenu --allow-markup --allow-images --insensitive --parse-search --prompt="Select Window" | {
    read -r id name
    echo "id: $id name: $name"
    swaymsg "[con_id=${id}]" focus
}

