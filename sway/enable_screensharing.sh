#! /bin/bash

export XDG_CURRENT_DESKTOP="sway"
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_SESSION_PATH XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_SESSION_PATH XDG_CURRENT_DESKTOP
systemctl --user restart wireplumber pipewire xdg-desktop-portal xdg-desktop-portal-wlr
