#!/usr/bin/env sh
cd /home/friday/config
nix fmt ./*
git add . &&
git commit -m 'rebuilding system'
nh os switch /home/friday/config

