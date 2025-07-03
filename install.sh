#!/usr/bin/env bash

# ============================================================
# Hyprland Setup Script
# ------------------------------------------------------------
# This script:
#  1) Installs yay if missing
#  2) Runs your custom video driver and package installers
#  3) Installs and enables Hyprland plugins if inside Hyprland
# ------------------------------------------------------------
# Usage:
#   ./setup.sh           # Prompts before each step
#   ./setup.sh --yesall  # Auto-accepts all steps
# ============================================================

set -e

# Parse --yesall flag
YESALL=false
if [[ "$1" == "--yesall" ]]; then
  YESALL=true
  EXTRA_ARGS="--yesall"
  echo "[+] --yesall flag detected: will auto-accept all prompts."
fi

# Helper function for y/n prompts
prompt() {
  local message="$1"
  if $YESALL; then
    echo "[+] Skipping prompt: $message"
    return 0
  fi
  while true; do
    read -rp "$message [y/N]: " yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]* | "") return 1 ;;
    *) echo "Please answer y or n." ;;
    esac
  done
}

# ------------------------------------------------------------
# Step 1: Install yay if missing
# ------------------------------------------------------------
if ! command -v yay &>/dev/null; then
  if prompt "yay not found. Install yay?"; then
    echo "[+] Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    echo "[✓] yay installed successfully."
  else
    echo "[!] Skipped yay installation."
  fi
else
  echo "[✓] yay is already installed."
fi

# ------------------------------------------------------------
# Step 2: Run video drivers installer
# ------------------------------------------------------------
if prompt "Run video drivers installer (install-vdrivers.sh)?"; then
  if [[ -f INSTALL/install-vdrivers.sh ]]; then
    chmod +x INSTALL/install-vdrivers.sh
    ./INSTALL/install-vdrivers.sh $EXTRA_ARGS
  else
    echo "[!] install-vdrivers.sh not found!"
  fi
else
  echo "[!] Skipped video drivers installer."
fi

# ------------------------------------------------------------
# Step 3: Run packages installer
# ------------------------------------------------------------
if prompt "Run packages installer (install-packages.sh)?"; then
  if [[ -f INSTALL/install-packages.sh ]]; then
    chmod +x INSTALL/install-packages.sh
    ./INSTALL/install-packages.sh
  else
    echo "[!] install-packages.sh not found!"
  fi
else
  echo "[!] Skipped packages installer."
fi

# ------------------------------------------------------------
# Step 4: Attempt to run Hyprland if not already running
# ------------------------------------------------------------
if [[ "$XDG_CURRENT_DESKTOP" != "Hyprland" && -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
  if prompt "Hyprland is not running. Attempt to start Hyprland session?"; then
    echo "[+] Trying to run Hyprland..."
    # Try to launch Hyprland in the background, from a tty or nested X session
    if command -v Hyprland &>/dev/null; then
      exec Hyprland
    else
      echo "[!] Hyprland executable not found in PATH!"
    fi
  else
    echo "[!] Skipped starting Hyprland."
  fi
else
  echo "[✓] Hyprland is already running."
fi

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now pipewire pipewire-pulse wireplumber

# ------------------------------------------------------------
# Step 5: Hyprland plugins setup
# ------------------------------------------------------------
if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" || -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
  echo "[✓] Hyprland detected."

  if prompt "Install Hyprland plugin build dependencies with yay?"; then
    yay -S --noconfirm --needed cmake meson cpio pkg-config g++ gcc
  else
    echo "[!] Skipped installing Hyprland build dependencies."
  fi

  if prompt "Update Hyprpm plugins and add official repo?"; then
    hyprpm update
    hyprpm add https://github.com/hyprwm/hyprland-plugins
  else
    echo "[!] Skipped Hyprpm update and repo add."
  fi

  if prompt "Enable Hyprland plugins (hyprbars, hyprexpo)?"; then
    hyprpm enable hyprbars
    hyprpm enable hyprexpo
    echo "[✓] Hyprland plugins enabled."
  else
    echo "[!] Skipped enabling Hyprland plugins."
  fi

else
  echo "[!] Hyprland not detected. Skipping Hyprland plugins setup."
fi

# ------------------------------------------------------------
# Step 6: Dotfiles itself
# ------------------------------------------------------------
if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" || -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
  echo "[✓] Hyprland detected."

  if prompt "Backup configs and install dotfiles?"; then
    cd INSTALL
    ./install-theme
  else
    echo "[!] Skipped installing dotfiles, no theme will be applied."

else
  echo "[!] Hyprland not detected. Skipping Hyprland plugins setup."
fi

echo "[✓] Script complete."
