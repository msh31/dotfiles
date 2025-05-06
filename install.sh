#!/usr/bin/env bash
sudo apt update && sudo apt upgrade -y
sudo apt install sway swayidle swaylock swaybg waybar nemo wofi kitty curl brightnessctl pulseaudio-utils blueman grim nmcli bluez network-manager notify-send -y

mkdir -p ~/.config/sway/scripts
mkdir -p ~/.config/waybar
mkdir -p ~/.config/wofi

cp wallpaper.png  ~/.config/sway/wallpaper.png

if [ ! -d ~/.local/share/fonts/JetBrainsMono ]; then
    mkdir -p ~/.local/share/fonts/JetBrainsMono
    echo "Downloading JetBrains Mono Nerd Font..."
    curl -fLo ~/.local/share/fonts/JetBrainsMono/JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf \
        https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
    fc-cache -f -v
fi

# copy config
cp sway/config ~/.config/sway/config
cp sway/scripts/powermenu.sh ~/.config/sway/scripts/powermenu.sh
cp sway/scripts/wifimenu.sh ~/.config/sway/scripts/wifimenu.sh
cp sway/scripts/bluetoothmenu.sh ~/.config/sway/scripts/bluetoothmenu.sh
cp sway/wallpaper.png ~/.config/sway/wallpaper.png

cp waybar/config ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css

cp wofi/style.css ~/.config/wofi/style.css

chmod +x ~/.config/sway/scripts/*.sh

# find and set thermal sensors
for zone in /sys/class/thermal/thermal_zone*/temp; do
    if [ -f "$zone" ]; then
        TEMP=$(cat "$zone" 2>/dev/null || echo "0")
        if [ "$TEMP" != "0" ]; then
            echo "Found thermal zone: $zone"
            sed -i "s|\"hwmon-path\": \"/sys/class/thermal/thermal_zone0/temp\"|\"hwmon-path\": \"$zone\"|g" ~/.config/waybar/config
            break
        fi
    fi
done

# find and set battery sensor
if [ -d "/sys/class/power_supply/BAT0" ]; then
    echo "Found battery: BAT0"
    sed -i 's/"bat": "BAT0"/"bat": "BAT0"/g' ~/.config/waybar/config
elif [ -d "/sys/class/power_supply/BAT1" ]; then
    echo "Found battery: BAT1"
    sed -i 's/"bat": "BAT0"/"bat": "BAT1"/g' ~/.config/waybar/config
fi

# update font cache
sudo fc-cache -f -v

echo "Installation complete! Reload Sway (Mod+Shift+C)"