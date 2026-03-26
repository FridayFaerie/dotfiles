#!/usr/bin/env sh

dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP=river;
systemctl --user restart xdg-desktop-portal;
systemctl --user restart xdg-desktop-portal-wlr;
systemctl --user restart xdg-desktop-portal-gtk
