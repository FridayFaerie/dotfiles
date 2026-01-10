#!/usr/bin/env sh

# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# aliases
source ~/.config/scripts/alias.sh

eval "$(starship init bash)"

. "$HOME/.cargo/env"

export LFS=/mnt/lfs
umask 022

# export TERM=xterm

#fortune | clolcat
#nitch
clear
