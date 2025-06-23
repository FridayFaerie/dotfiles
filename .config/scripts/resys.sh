#!/usr/bin/env sh
cd /home/friday/config
nix fmt ./*

git add . &&
git commit -m "rebuilt system     at $(date -u +'%H:%M:%S %d/%m/%Y %Z')"

nh os switch /home/friday/config --hostname friday
# nh os switch /home/friday/config

