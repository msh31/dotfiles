#!/usr/bin/env bash
options="Lock\nLogout\nReboot\nShutdown"
selected=$(echo -e "$options" | wofi --dmenu --insensitive --width 200 --height 160 --prompt "Power Menu" --style ~/.config/wofi/style.css --hide-search=true)

case $selected in
    "Lock")
        swaylock -f -c 000000
        ;;
    "Logout")
        swaymsg exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac