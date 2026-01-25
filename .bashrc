#!/usr/bin/env sh

# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# aliases
source ~/.config/scripts/alias.sh

eval "$(starship init bash)"

eval "$(direnv hook bash)"

alias oxarm="cd ~/oxarm/RobotArmPackages2/ && source /opt/ros/jazzy/setup.bash && source ./setup.sh"

#fortune | clolcat
#nitch
clear
