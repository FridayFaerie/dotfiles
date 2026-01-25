#!/usr/bin/env fish
while :
  set battery $(cat /sys/class/power_supply/BAT0/capacity)

  if test $battery -le 20;
    ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Sys-App-Error-Serious.ogg
  else if test $battery -ge 90;
    ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Sys-App-Error.ogg
  end

  sleep 600
end
