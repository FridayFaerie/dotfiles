#!/usr/bin/env bash

current_wallpaper=0
while true; do
  choice=$(( $RANDOM % 10 ))
  if [[ choice -le 4 ]]; then
    rain="a"
  elif [[ choice -ge 8 ]]; then
    rain="b"
  fi
  hyprctl --quiet hyprpaper reload ",~/.config/wallpapers/test_${current_wallpaper}_${rain}.png"
  current_wallpaper=$((current_wallpaper+1))
  if [[ current_wallpaper -eq 20 ]]; then
    current_wallpaper=0
  fi
  echo "$current_wallpaper $rain"
  sleep 5
done
