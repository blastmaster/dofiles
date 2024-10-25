#! /usr/bin/env bash


IFACE=${IFACE:-wlp0s20f3}

# Do not display this block if the wireless interface is down.
[[ "$(cat /sys/class/net/${IFACE}/operstate)" = "down" ]] && exit

essid=$(/sbin/iwconfig $IFACE | grep -i essid | cut -d '"' -f2 )

echo "$essid"
echo "$essid"
exit
