#!/usr/bin/env bash

#wallpapers
hyprpaper &

#can add pkgs.networkmanagerapplet to packages
nm-applet --indicator &

# the bar
quickshell &

# notifs
# quickshell -p ~/.config/quickshell/notifs/ &
swaync &

# idle
hypridle &

hyprsunset -t 4000 &


bash ~/.config/scripts/switch_wallpaper.sh s1
