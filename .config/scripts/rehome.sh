#!/usr/bin/env sh
cd ~/config
nix fmt ./*
git add . &&
git commit -m 'rebuilding home'

if [[ "$HOME" == "friday" ]]; then
  nh home switch ~/config
else
  home-manager switch --flake . --extra-experimental-features nix-command --extra-experimental-features flakes
fi
