#!/bin/bash

cfg_path="$HOME/.config"

find "$(pwd)" -maxdepth 1 -type f -exec chmod +x {} +
find "$(pwd)/../../waybar/scripts/" -maxdepth 1 -type f -exec chmod +x {} +
chmod +x "../../../.wallpapers/scripts/wallpaper-loop.sh"
