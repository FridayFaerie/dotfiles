#!/usr/bin/env sh
cd /home/friday/config
nix fmt ./*
git add . &&
git commit -m 'rebuilding home'
nh home switch /home/friday/config
