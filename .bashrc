#!/bin/sh

alias nixosrebuild="sudo nixos-rebuild switch --flake ~/config/#default"
alias nixosupdate="sudo nix flake update"
alias homerebuild="home-manager switch -f ~/config/home.nix"
alias p="nix-shell -p"
fortune | lolcat
