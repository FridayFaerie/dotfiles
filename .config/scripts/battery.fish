#!/usr/bin/env fish

set long 300
set short 60
set timer $long
while :
  if test ! -e ~/.config/scripts/ignore-battery;
    set battery $(cat /sys/class/power_supply/BAT0/capacity)
    set batteryStatus $(cat /sys/class/power_supply/BAT0/status)

    if test $battery -le 20 && string match -v $batteryStatus "Charging";
      notify-send -u critical -t 5000 "Low Battery" "Please charge!"
      ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Im-Nudge.ogg
      set timer $short
    else if test $battery -ge 90 && string match -v $batteryStatus "Discharging";
      notify-send -u normal -t 5000 "High Battery" "Please disconnect!"
      ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Sys-App-Error.ogg
      set timer $short
    else
      set timer $long
    end

    sleep $timer
  end
end
