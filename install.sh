#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y

sudo apt install sway swayidle swaylock waybar nemo wofi kitty -y

mkdir ~/.config/sway
mkdir ~/.config/waybar
mkdir ~/.config/wofi

mv sway/config ~/.config/sway/config
mv waybar/config ~/.config/waybar/config
mv waybar/style.css ~/.config/waybar/style.css
mv wofi/style.css ~/.config/wofi/style.css

