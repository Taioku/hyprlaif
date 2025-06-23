#!/bin/bash

# Set working and backup directories
HERE="$(pwd)"
BAK="$HERE/BACKUP"

# Stop if BACKUP folder already exists
if [ -d "$BAK" ]; then
  echo "❌ BACKUP folder already exists at $BAK. Aborting to prevent overwrite."
  exit 1
fi

# Create BACKUP folder
mkdir -p "$BAK"

# Move target file to BAKUP folder and create symbolic link
backup_and_link() {
  local TARGET="$1"
  local SOURCE="$HERE/$TARGET"
  local DEST="$HOME/$TARGET"

  if [ -e "$DEST" ] || [ -L "$DEST" ]; then
    echo "Backing up $DEST to $BAK"
    mv "$DEST" "$BAK/"
  fi

  echo "Linkin $SOURCE to $DEST"
  ln -sf "$SOURCE" "$DEST"
}

# Read files/folders from config and process
while IFS= read -r line || [[ -n "$line" ]]; do
  # Skip empty lines or comments
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
  backup_and_link "$line"
done < install.conf

# Reload hyprland
hyprctl reload

