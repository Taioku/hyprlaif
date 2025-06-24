#!/bin/bash

# Set working and backup directories
HERE="$(pwd)"
BAK="$HERE/BACKUP"

# Stop if BACKUP folder already exists
if [ -d "$BAK" ]; then
  echo "❌ BACKUP folder already exists at $BAK. Aborting to prevent overwrite."
  exit 1
fi

# Check if config file exists
if [[ ! -f "$HERE/install-theme.conf" ]]; then
  echo "❌ File 'install-theme.conf' not found!"
  exit 1
fi

# Create BACKUP folder
mkdir -p "$BAK"

# Move target file to BAKUP folder and create symbolic link
backup_and_link() {
  local TARGET="$1"
  local SOURCE="$HERE/../$TARGET"
  local DEST="$HOME/$TARGET"
  local PARENT_DIR
  local BAK_FOLDER

  # Extrackt parent directory
  # If '.', it's a top-level file — no folder needed
  PARENT_DIR="$(dirname "$TARGET")"
  if [[ "$PARENT_DIR" == "." ]]; then
    BAK_FOLDER="$BAK"
  else
    BAK_FOLDER="$BAK/$PARENT_DIR"
  fi

  # Create parent folder if it doesnt exists
  mkdir -p "$BAK_FOLDER"


  if [ -e "$DEST" ] || [ -L "$DEST" ]; then
    echo "Backing up $DEST to $BAK_FOLDER"
    mv "$DEST" "$BAK_FOLDER"
  fi

  echo "Linkin $SOURCE to $DEST"
  ln -sf "$SOURCE" "$DEST"
}

# Read files/folders from config and process
while IFS= read -r line || [[ -n "$line" ]]; do
  # Skip empty lines or comments
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  backup_and_link "$line"
done < install-theme.conf

# Reload hyprland
hyprctl reload

