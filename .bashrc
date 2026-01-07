#!/usr/bin/env sh

# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# aliases
source ~/.config/scripts/alias.sh

eval "$(starship init bash)"


export LFS=/mnt/lfs
umask 022

#fortune | clolcat
#nitch
clear
. "$HOME/.cargo/env"
