#!/bin/bash

HOUR=$(date +%H)

if [ "$HOUR" -ge 0 ] && [ "$HOUR" -lt 6 ]; then
    NIGHT_PAPER="$HOME/Pictures/the-folder/wallpapers/two.jpg"
    hyprctl hyprpaper wallpaper "DP-1,$NIGHT_PAPER"
    hyprctl hyprpaper wallpaper "DP-3,$NIGHT_PAPER"
    hyprctl hyprpaper wallpaper "DP-2,$NIGHT_PAPER"
else
    DAY_PAPER="$HOME/Pictures/wallpaper2.jpg"
    hyprctl hyprpaper wallpaper "DP-1,$DAY_PAPER"
    hyprctl hyprpaper wallpaper "DP-3,$DAY_PAPER"
    hyprctl hyprpaper wallpaper "DP-2,$DAY_PAPER"
fi
