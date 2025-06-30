#!/usr/bin/env bash

# the bar
quickshell -p ~/projects/fantasice/quickshell/ --daemonize
# quickshell --daemonize

#wallpapers
hyprpaper > ~/log.log &

#can add pkgs.networkmanagerapplet to packages
nm-applet --indicator &


# idle
hypridle &

hyprsunset -t 4000 &


# bash ~/.config/scripts/switch_wallpaper.sh g2
bash ~/.config/scripts/switch_wallpaper.sh g6


# hyprctl setcursor swordcursor 32
