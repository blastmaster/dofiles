#! /usr/bin/env bash


IFACE=${IFACE:-wlp3s0}

essid=$(/sbin/iwconfig $IFACE | grep -i essid | cut -d '"' -f2 )

echo "$essid"
echo "$essid"
exit
