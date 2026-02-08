#!/usr/bin/env fish

set timer 600
while :
  set battery $(cat /sys/class/power_supply/BAT0/capacity)
  set batteryStatus $(cat /sys/class/power_supply/BAT0/status)

  if test $battery -le 20 && string match -v $batteryStatus "Charging";
    notify-send -u critical -t 5000 "Low Battery" "Please charge!"
    ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Im-Nudge.ogg
    set timer 60
  else if test $battery -ge 90 && string match -v $batteryStatus "Discharging";
    notify-send -u normal -t 5000 "High Battery" "Please disconnect!"
    ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Sys-App-Error.ogg
    set timer 60
  else
    set timer 600
  end

  sleep $timer
end
