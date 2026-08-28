#!/bin/bash

choice=$(printf "⏻ Shutdown\n↻ Reboot\n⇦ Logout" | \
wofi --dmenu \
     --prompt "Power" \
     --style ~/.config/wofi/power.css \
     --width 320 \
     --height 260)

case "$choice" in
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    "↻ Reboot")
        systemctl reboot
        ;;
    "⇦ Logout")
        hyprctl dispatch exit
        ;;
esac
