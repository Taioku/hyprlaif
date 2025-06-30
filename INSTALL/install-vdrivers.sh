#!/usr/bin/env bash

# ── GPU Driver Installer for Arch with 32-bit support ───────────

# ============================================================
# Usage:
#   ./install-vdrivers.sh           # Prompts before installing
#   ./install-vdrivers.sh --yesall  # Installs automatically
# ============================================================

# Parse --yesall flag
YESALL=false
if [[ "$1" == "--yesall" ]]; then
  YESALL=true
  echo "[+] --yesall flag detected: will auto-install drivers."
fi

echo ""
echo "[+] Detecting GPUs..."
GPUS=$(lspci | grep -E "VGA|3D")

echo "Detected GPU(s):"
echo "$GPUS"
echo ""

# Initialize drivers array
DRIVERS=()

# Common packages for all GPUs
COMMON_PKGS=(libglvnd lib32-libglvnd)

# Intel
if echo "$GPUS" | grep -qi intel; then
  echo "→ Intel GPU detected."
  DRIVERS+=(mesa vulkan-intel libva-mesa-driver mesa-vdpau)
fi

# AMD
if echo "$GPUS" | grep -qi amd; then
  echo "→ AMD GPU detected."
  DRIVERS+=(mesa vulkan-radeon libva-mesa-driver mesa-vdpau linux-firmware)
fi

# NVIDIA
if echo "$GPUS" | grep -qi nvidia; then
  echo "→ NVIDIA GPU detected."
  DRIVERS+=(nvidia nvidia-utils nvidia-settings)
fi

# Add common packages
DRIVERS+=("${COMMON_PKGS[@]}")

# Remove duplicates
mapfile -t DRIVERS < <(printf '%s\n' "${DRIVERS[@]}" | sort -u)

echo ""
echo "Packages to install: ${DRIVERS[*]}"

# Prompt unless --yesall is passed
if $YESALL; then
  echo "[+] Installing drivers without prompt..."
  sudo pacman -S --needed "${DRIVERS[@]}"
else
  read -rp "Install these drivers now? [y/N]: " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    sudo pacman -S --needed "${DRIVERS[@]}"
  else
    echo "[!] Installation skipped."
  fi
fi

