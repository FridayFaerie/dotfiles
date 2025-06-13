#!/usr/bin/env sh
cd ~/config
nix fmt ./*

git add . &&
git commit -m "rebuilt home at $(date -u +'%H:%M:%S %d/%m/%Y %Z')"

if [[ "$USER" == "friday" ]]; then
  nh home switch /home/friday/config
else
  home-manager switch --flake . --extra-experimental-features nix-command --extra-experimental-features flakes
fi
