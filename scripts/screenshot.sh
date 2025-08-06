#!/bin/bash

filename="$HOME/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"

# Take region screenshot without stealing Hyprland input
hyprctl dispatch exec "grim -g \"\$(slurp)\" \"$filename\""

# Optional: notify user
# notify-send "Screenshot saved to $filename"

