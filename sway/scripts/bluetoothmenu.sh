#!/usr/bin/env bash
paired_devices=$(bluetoothctl devices | grep Device | cut -d ' ' -f 3-)
available_devices=$(bluetoothctl scan on & sleep 3; kill $!; bluetoothctl devices | grep Device | cut -d ' ' -f 3- | sort | uniq)

options="Toggle Bluetooth\nScan for Devices\nOpen Bluetooth Settings"
all_options="$options\n$available_devices"

selected=$(echo -e "$all_options" | wofi --dmenu --insensitive --width 300 --height 400 --prompt "Bluetooth Menu" --style ~/.config/wofi/style.css)

get_device_mac() {
    bluetoothctl devices | grep "$1" | head -n 1 | cut -d ' ' -f 2
}

case $selected in
    "Toggle Bluetooth")
        
        if bluetoothctl show | grep -q "Powered: yes"; then
            bluetoothctl power off
        else
            bluetoothctl power on
        fi
        ;;
    "Scan for Devices")
        notify-send "Bluetooth" "Scanning for devices..."
        bluetoothctl scan on & sleep 5; kill $!
        ;;
    "Open Bluetooth Settings")
        blueman-manager &
        ;;
    *)
        
        if [ -n "$selected" ]; then
            device_mac=$(get_device_mac "$selected")

            if [ -n "$device_mac" ]; then
                
                if bluetoothctl info "$device_mac" | grep -q "Connected: yes"; then
                    
                    bluetoothctl disconnect "$device_mac"
                    notify-send "Bluetooth" "Disconnected from $selected"
                else
                    
                    bluetoothctl connect "$device_mac"
                    notify-send "Bluetooth" "Connected to $selected"
                fi
            fi
        fi
        ;;
esac