# - Essential Packages
yay -S --noconfirm \
  wayland xdg-desktop-portal xdg-desktop-portal-hyprland xdg-user-dirs hyprpolkitagent \
  qt5-wayland qt6-wayland \
  pipewire pipewire-pulse wireplumber pulsemixer \
  wl-clipboard \
  grim slurp swappy \
  swaync waybar wofi\
  networkmanager bluez bluez-utils blueman \
  neovim nvchad-git unzip wget \
  eza btop fastfetch \
  kitty yazi feh thunar

# - Aesthetics & Theming
yay -S --noconfirm \
  nwg-look gnome-themes-extra gtk-engine-murrine sassc \
  ttf-jetbrains-mono-nerd ttf-twemoji \
  waypaper hyprpaper

# - Utilities
yay -S --noconfirm \
  calc mate-calc bash-completion

# - Media Support
yay -S --noconfirm \
  mplayer

# - Fun
yay -S --noconfirm \
  lolcat pipes.sh bonsai.sh asciiquarium cava cxxmatrix

# - Enable essential services
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --user --now pipewire pipewire-pulse wireplumber

# Optional Apps
yay -S --noconfirm \
  #discord
  #steam
  #obsidian
  #spotify-launcher
  #spcietify-cli # Need to start spotify-launcher and log in to work

