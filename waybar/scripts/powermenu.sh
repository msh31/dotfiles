#!/bin/bash

shutdown="⏻ Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend=" Suspend"
logout=" Logout"
cancel=" Cancel"

chosen=$(echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout\n$cancel" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    "$shutdown") systemctl poweroff ;;
    "$reboot") systemctl reboot ;;
    "$lock") swaylock ;;
    "$suspend") systemctl suspend ;;
    "$logout") swaymsg exit ;;
    *) exit 0 ;;
esac
