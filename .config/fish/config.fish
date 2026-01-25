function fish_greeting
    # eval (ssh-agent -c)
	clear
end
bind "/" expand-abbr or self-insert

source ~/.config/scripts/alias.sh

function starship_transient_prompt_func
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
