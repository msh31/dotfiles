#!/usr/bin/env bash
available_networks=$(nmcli -t -f SSID,SIGNAL dev wifi list | sort -nr -k2 | awk -F: '{print $1}' | awk NF | uniq)
options="Connect\nToggle WiFi\nRescan Networks"
all_options="$options\n$available_networks"

selected=$(echo -e "$all_options" | wofi --dmenu --insensitive --width 300 --height 400 --prompt "WiFi Menu" --style ~/.config/wofi/style.css)

case $selected in
    "Connect")
        chosen_network=$(echo -e "$available_networks" | wofi --dmenu --insensitive --width 300 --height 400 --prompt "Select Network" --style ~/.config/wofi/style.css)
        if [ -n "$chosen_network" ]; then
            if nmcli -t -f NAME con show | grep -q "^$chosen_network$"; then
                nmcli con up "$chosen_network"
            else
                password=$(wofi --dmenu --password --prompt "Enter password for $chosen_network" --style ~/.config/wofi/style.css)
                if [ -n "$password" ]; then
                    nmcli dev wifi connect "$chosen_network" password "$password"
                fi
            fi
        fi
        ;;
    "Toggle WiFi")
        if nmcli radio wifi | grep -q "enabled"; then
            nmcli radio wifi off
        else
            nmcli radio wifi on
        fi
        ;;
    "Rescan Networks")
        nmcli dev wifi rescan
        ;;
    *)
        if [ -n "$selected" ]; then
            if nmcli -t -f NAME con show | grep -q "^$selected$"; then
                nmcli con up "$selected"
            else
                password=$(wofi --dmenu --password --prompt "Enter password for $selected" --style ~/.config/wofi/style.css)
                if [ -n "$password" ]; then
                    nmcli dev wifi connect "$selected" password "$password"
                fi
            fi
        fi
        ;;
esac