#!/bin/bash

# Set working and backup directories
HERE="$(pwd)"
BAK="$HERE/BACKUP"

# Abort if BACKUP folder does not exist
if [ ! -d "$BAK" ]; then
  echo "❌ No BACKUP folder found at $BAK. Nothing to uninstall."
  exit 1
fi

# Check if config file exists
if [[ ! -f "$HERE/install-theme.conf" ]]; then
  echo "❌ File 'install-theme.conf' not found!"
  exit 1
fi


# Restore target file from BACKUP
restore_backup() {
  local TARGET="$1"
  local SOURCE="$BAK/$TARGET"
  local DEST="$HOME/$TARGET"

  # If the current version is a symlink, remove it
  if [ -L "$DEST" ]; then
    echo "Removing symlink $DEST"
    rm "$DEST"
  elif [ -e "$DEST" ]; then
    echo "⚠️ $DEST exists but is not a symlink — skipping"
    return
  fi

  # Restore the original file/folder from BACKUP
  if [ -e "$SOURCE" ]; then
    mkdir -p "$(dirname "$DEST")"
    echo "Restoring $SOURCE to $DEST"
    mv "$SOURCE" "$DEST"
  else
    echo "⚠️ No backup found for $TARGET"
  fi
}

# Read files/folders from config and process
while IFS= read -r line || [[ -n "$line" ]]; do
  # Skip empty lines or comments
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
  restore_backup "$line"
done < install-theme.conf

# Remove BACKUP folder if empty
remove_empty_dirs() {
  local TARGET_DIR="$1"
  if [[ -z "$TARGET_DIR" || ! -d "$TARGET_DIR" ]]; then
    echo "Usage: remove_empty_dirs <target-directory>"
    return 1
  fi
  # Recursively remove empty folders
  find "$TARGET_DIR" -type d -empty -delete
  
  if [[ -d "$TARGET_DIR" && -n "$(find "$TARGET_DIR" -type f)" ]]; then
    echo "⚠️ Could not remove BACKUP folder. There are existing files that have not been restored."
  fi
}

remove_empty_dirs "$BAK"

# Reload hyprland
hyprctl reload

