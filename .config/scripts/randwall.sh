#!/usr/bin/env bash

killall swaybg

# Folder containing wallpapers
WALLPAPER_DIR="$HOME/.config/walls/"

# Pick a random file from the folder
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using swaybg
swaybg -i "$WALLPAPER" -m fill & disown
