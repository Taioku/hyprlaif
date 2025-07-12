#!/usr/bin/env bash

# === Usage: ./create_firefox_webapp_profile.sh <profile-name> ===

APP_NAME="$1"

if [ -z "$APP_NAME" ]; then
  echo "Usage: $0 <profile-name>"
  exit 1
fi

PROFILE_DIR="$HOME/.mozilla/firefox"
PROFILES_INI="$PROFILE_DIR/profiles.ini"

# === 1. Create profile if it doesn't exist ===
if ! grep -q "$APP_NAME" "$PROFILES_INI"; then
  echo "Creating Firefox profile: $APP_NAME"
  firefox -CreateProfile "$APP_NAME"
fi

# === 2. Find the actual profile folder ===
PROFILE_FOLDER=$(grep -A 2 "\[$APP_NAME\]" "$PROFILES_INI" | grep Path= | cut -d= -f2)

if [ -z "$PROFILE_FOLDER" ]; then
  echo "Could not find profile folder for $APP_NAME"
  exit 1
fi

echo "✅ Profile '$APP_NAME' is ready to use!"

# === 5. Launch the web app ===
URL="https://example.com"
firefox --new-instance --profile "$PROFILE_DIR/$PROFILE_FOLDER" "$URL"
