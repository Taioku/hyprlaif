#!/bin/bash

# === Configuration ===
WALLPAPER_DIR="$HOME/.wallpapers"   # Folder with your wallpapers
INTERVAL=300                        # Time in seconds between changes
PIDFILE="/tmp/change_wallpaper.pid"

# Write current PID to a file so we can stop it later
echo $$ > "$PIDFILE"

# === Infinite Loop ===
while true; do
    # Set a random wallpaper from the folder using Waypaper
    waypaper --random --folder "$WALLPAPER_DIR"

    # Wait before changing again
    sleep "$INTERVAL"
done
