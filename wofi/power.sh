#!/bin/bash

choice=$(printf "⏻ Shutdown\n↻ Reboot\n🔒 Lock\n⇦ Logout" | \
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
    "🔒 Lock")
        pidof hyprlock >/dev/null || hyprlock
        ;;
    "⇦ Logout")
        hyprctl dispatch exit
        ;;
esac
