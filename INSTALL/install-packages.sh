# - Essential Packages
yay -S --noconfirm \
  hyprland wayland xdg-desktop-portal-hyprland \
  qt5-wayland qt6-wayland \
  pipewire pulsemixer \
  wl-clipboard wl-copy \
  grim slurp swappy \
  swaync waybar wofi hyprpolkitagent \
  networkmanager overskride \
  neovim unzip wget \
  eza btop fastfetch \
  kitty yazi feh nautilus

# - Aesthetics & Theming
yay -S --noconfirm \
  nwg-look gnome-themes-extra gtk-engine-murrine sassc \
  ttf-jetbrains-mono-nerd ttf-twemoji \
  waypaper hyprpaper

# - Utilities
yay -S --noconfirm \
  galculator

# - Media Support
yay -S --noconfirm \
  mplayer

# - Fun
yay -S --noconfirm \
  lolcat pipes.sh bonsai.sh asciiquarium cava cxxmatrix

# - NvChad Setup
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# - Enable essential services
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now pipewire pipewire-pulse

# - Install and enable hyprland plugins
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
#hyprpm enable hyprbars # if you want window bars
hyprpm enable hyprexpo

# Optional Apps
yay -S --noconfirm \
  #discord
  #steam
  #obsidian
  #spotify-launcher
  #spcietify-cli # Need to start spotify-launcher and log in to work

