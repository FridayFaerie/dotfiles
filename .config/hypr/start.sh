#!/usr/bin/env bash

#wallpapers
hyprpaper &

#can add pkgs.networkmanagerapplet to packages
nm-applet --indicator &

# the bar
waybar &

# notifs
swaync &

# idle
hypridle &

wlsunset -T 6000 &
