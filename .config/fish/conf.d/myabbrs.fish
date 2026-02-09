abbr -a --regex '^\\.\\.+$' --function multicd -- dotdot
# abbr -a -- smj 'quickshell -p /home/friday/projects/shimeji'
# abbr -a --position anywhere --command cd -- s /home/friday/projects/shimeji
# abbr -a -- r 'nix run nixpkgs/nixos-unstable#'
# abbr -a --position anywhere --command nix -- n '--log-format internal-json -v &| nom --json'
abbr -a -- n 'nvim'
abbr -a -- cd 'z'
# abbr -a -- matlab 'matlab & disown && sleep 10; exit'
abbr -a -- c 'nvim ~/.config/'
abbr -a -- tp 'nvim -c TypstPreview'

# Source - https://stackoverflow.com/a
# Posted by Dave Powers
# Retrieved 2026-01-26, License - CC BY-SA 4.0
bind \cz 'fg 2>/dev/null; commandline -f repaint'
