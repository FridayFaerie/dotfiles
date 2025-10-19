#!/usr/bin/env bash

# the bar
# quickshell -p ~/projects/fantasice/quickshell/ --daemonize
# quickshell --daemonize
quickshell -c feldspar -d &

batsignal &

#wallpapers
hyprpaper &

#can add pkgs.networkmanagerapplet to packages
# nm-applet --indicator &


# idle
hypridle &

hyprsunset -t 4500 &


# bash ~/.config/scripts/switch_wallpaper.sh n1


# hyprctl setcursor swordcursor 32

hyprpm reload -n &
