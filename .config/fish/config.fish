function fish_greeting
    # eval (ssh-agent -c)
	# clear
end
bind "/" expand-abbr or self-insert

source ~/.config/scripts/alias.sh

function starship_transient_prompt_func
    printf \n
    starship module character
end
function starship_transient_rprompt_func
    starship module directory
    starship module time
end
starship init fish | source
enable_transience

zoxide init fish | source

direnv hook fish | source


# if status is-interactive
# end

# export LFS=/mnt/lfs
# umask 022


# set -Ux TERM xterm
export TERM=xterm
export MANPAGER='nvim +Man!'
