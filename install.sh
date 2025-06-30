# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

# - Hyprland itself
yay -S --noconfirm \
  hyprland-git

hyprland

cd INSTALL
chmod +x install-packages.sh
#./install-packages.sh

# - Install and enable hyprland plugins
yay -S --noconfirm \
#  cmake meson cpio pkg-config g++ gcc

#hyprpm update
#hyprpm add https://github.com/hyprwm/hyprland-plugins
#hyprpm enable hyprbars # if you want window bars
#hyprpm enable hyprexpo
