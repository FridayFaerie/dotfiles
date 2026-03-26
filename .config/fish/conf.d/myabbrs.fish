abbr -a --regex '^\\.\\.+$' --function multicd -- dotdot
# abbr -a -- smj 'quickshell -p /home/friday/projects/shimeji'
# abbr -a --position anywhere --command cd -- s /home/friday/projects/shimeji
# abbr -a -- r 'nix run nixpkgs/nixos-unstable#'
# abbr -a --position anywhere --command nix -- n '--log-format internal-json -v &| nom --json'
abbr -a -- n 'nvim'
# abbr -a -- cd 'z'
# abbr -a -- matlab 'matlab & disown && sleep 10; exit'
abbr -a -- c 'nvim ~/.config/'
abbr -a -- tp 'nvim -c TypstPreview'
abbr -a -- rm 'trash-put'
abbr -a -- cat 'batcat'
# abbr -a -- ls 'eza --icons'
abbr -a -- jjlog 'jj log -r "all()" --reversed --no-pager -n 70'
abbr -a -- lsblk 'lsblk -o name,label,mountpoint,uuid,FSUSE%,size'
abbr -a -- cal 'ncal -b'

abbr -a -- view 'nvim -R'
abbr -a -- diff 'vimdiff'

# Source - https://stackoverflow.com/a
# Posted by Dave Powers
# Retrieved 2026-01-26, License - CC BY-SA 4.0
bind \cz 'fg 2>/dev/null; commandline -f repaint'

bind \cs 'for cmd in sudo doas please run0; if command -q $cmd; fish_commandline_prepend $cmd; break; end; end'
bind \ck __fish_list_current_token
