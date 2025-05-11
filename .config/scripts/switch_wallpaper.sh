#!/usr/bin/env bash

# help from https://gitlab.com/fazzi/nixohess/-/blob/main/home/modules/scripts/bin/wallust.sh

wallpaper_path="/home/friday/.config/wallpapers/"

if [ -z "$1" ]; then
  echo "add wallpaper as arg :/"
  exit 1
fi

wallpaper_path+="${1}"

hyprctl hyprpaper reload ,"$wallpaper_path" -q &

wallust run "$wallpaper_path"


# TODO: pywalfox? discord?
