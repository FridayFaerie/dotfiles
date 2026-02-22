#!/usr/bin/env sh

# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# aliases
source ~/.config/scripts/alias.sh
export PATH=$HOME/.cargo/bin:$PATH

eval "$(starship init bash)"

eval "$(direnv hook bash)"

alias oxarm="cd ~/oxarm/RobotArmPackages2/ && source /opt/ros/jazzy/setup.bash && source ./setup.sh"

eval "$(zoxide init bash)"

#sourcing oxarm things
source /opt/ros/jazzy/setup.bash
pushd ~/oxarm/robot/
source ~/oxarm/robot/setup.sh
popd

clear
#fortune | clolcat
#nitch
# clear
