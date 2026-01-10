function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) -1) ../)
end

set -g fish_key_bindings fish_default_key_bindings
