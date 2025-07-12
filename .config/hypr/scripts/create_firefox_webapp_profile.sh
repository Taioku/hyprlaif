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

# === 3. Enable userChrome.css support ===
USER_JS="$PROFILE_DIR/$PROFILE_FOLDER/user.js"
if ! grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$USER_JS" 2>/dev/null; then
  echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >>"$USER_JS"
  echo "Enabled userChrome.css in user.js"
fi

# === 4. Add userChrome.css ===
CHROME_DIR="$PROFILE_DIR/$PROFILE_FOLDER/chrome"
mkdir -p "$CHROME_DIR"

cat >"$CHROME_DIR/userChrome.css" <<EOF
/* Hide tabs and navigation bar */
#TabsToolbar, #nav-bar {
  visibility: collapse !important;
}
#PersonalToolbar {
  visibility: collapse !important;
}
EOF

echo "Created userChrome.css at $CHROME_DIR/userChrome.css"

echo "✅ Profile '$APP_NAME' is ready to use!"
