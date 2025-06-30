# Install yay
if ! command -v yay &>/dev/null; then
  echo "yay not found. Installing yay..."
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
else
  echo "yay is already installed."
fi

# - Install Packages
cd INSTALL
chmod +x install-packages.sh
./install-packages.sh

# - Install and enable hyprland plugins
yay -S --noconfirm --needed \
#  cmake meson cpio pkg-config g++ gcc

#hyprpm update
#hyprpm add https://github.com/hyprwm/hyprland-plugins
#hyprpm enable hyprbars # if you want window bars
#hyprpm enable hyprexpo
