#!/usr/bin/env bash

# === CONFIG ===
threshold=2                                            # distance in px to trigger starting Waybar
safe_zone=50                                           # distance in px away before stopping Waybar
check_interval=0.1                                     # seconds between checks
waybar_command="$HOME/.config/waybar/scripts/start.sh" # your Waybar launcher
waybar_process="waybar"                                # process name to check

# === LOOP ===
while true; do
  # Get cursor position
  read -r X Y <<<$(hyprctl cursorpos | awk '{print int($1), int($2)}')

  if [ "$Y" -le "$threshold" ]; then
    # Cursor is near top edge — start Waybar if not running
    if ! pgrep -x "$waybar_process" >/dev/null; then
      echo "Top edge touched — starting Waybar"
      $waybar_command &
    fi
  elif [ "$Y" -ge "$safe_zone" ]; then
    # Cursor has moved away by at least safe_zone — kill Waybar if running
    if pgrep -x "$waybar_process" >/dev/null; then
      echo "Mouse left safe zone — killing Waybar"
      pkill -x "$waybar_process"
    fi
  fi

  sleep $check_interval
done
