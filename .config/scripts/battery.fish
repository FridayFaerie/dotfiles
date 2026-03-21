#!/usr/bin/env fish


if test (count (pidof batteryscript -d \n)) -gt 1; 
  exit
end

set long 300
set short 60
set timer $long
while :
  set battery $(cat /sys/class/power_supply/BAT0/capacity)
  set batteryStatus $(cat /sys/class/power_supply/BAT0/status)

  echo "current status is:"
  echo $batteryStatus

  if test $battery -le 20 && string match -v $batteryStatus "Charging";
    echo "sending low bat notif"
    notify-send -u critical -t 5000 "Low Battery" "Please charge!"
    ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Im-Nudge.ogg
    set timer $short
  else if test $battery -ge 90 && string match -v $batteryStatus "Discharging";
    echo "high bat detected"
    if test ! -e ~/.config/scripts/ignore-high-battery;
      echo "sending high bat notif"
      notify-send -u normal -t 5000 "High Battery" "Please disconnect!"
      ffplay -autoexit -nodisp /usr/share/sounds/Oxygen-Sys-App-Error.ogg
      set timer $short
    else
      echo "high bat ignored"
      set timer $long
    end
  else
    set timer $long
  end

  sleep $timer
end
