abbr -a --regex '^\\.\\.+$' --function multicd -- dotdot
abbr -a --position anywhere -- qui /home/friday/.config/quickshell/
abbr -a -- recon 'cd /home/friday/config'
abbr -a -- smj 'quickshell -p /home/friday/projects/shimeji'
abbr -a --position anywhere --command cd -- s /home/friday/projects/shimeji
abbr -a -- r 'nix run nixpkgs/nixos-unstable#'
abbr -a -- n 'nvim'
abbr -a -- cd 'z'
abbr -a --position anywhere --command nix -- n '--log-format internal-json -v &| nom --json'
abbr -a -- matlab 'matlab & disown && sleep 10; exit'
abbr -a -- c 'nvim .config/'
