#
#!/bin/bash
#

HERE="$(pwd)"
BAK="$HERE/BACKUP"

echo $THEME_FOLDER

# Link .bashrc
mv "$HOME/.bashrc" "$BAK"
ln -sf "$HERE/.bashrc" "$HOME"

# Link .wallpapers
mv "$HOME/.wallpapers" "$BAK"
ln -sf "$HERE/.wallpapers" "$HOME"

hyprctl reload

