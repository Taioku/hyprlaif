#
#!/bin/bash
#

THEME_FOLDER="$(pwd)"

echo $THEME_FOLDER

# Link Files
ln -sf "$THEME_FOLDER/.bashrc" "$HOME/.bashrc"

hyprctl reload

