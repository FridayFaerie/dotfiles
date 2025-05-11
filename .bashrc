#!/usr/bin/env sh

source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# aliases
source ~/.config/scripts/alias.sh

eval "$(starship init bash)"

clear && leaf
source /opt/ros/jazzy/setup.bash
echo -e "\033[0;31mRemember to run 'source setup.sh'\033[0;0m"
