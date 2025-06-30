#!/usr/bin/env bash

# ── GPU Driver Installer for Arch ──────────────────────────────

# Detect GPU(s)
GPUS=$(lspci | grep -E "VGA|3D")

echo "Detected GPU(s):"
echo "$GPUS"
echo ""

# Init package list
DRIVERS=()

# Check for Intel
if echo "$GPUS" | grep -qi intel; then
  echo "→ Intel GPU detected."
  DRIVERS+=("mesa" "vulkan-intel" "libva-mesa-driver" "mesa-vdpau")
fi

# Check for AMD
if echo "$GPUS" | grep -qi amd; then
  echo "→ AMD GPU detected."
  DRIVERS+=("mesa" "vulkan-radeon" "libva-mesa-driver" "mesa-vdpau" "linux-firmware")
fi

# Check for NVIDIA
if echo "$GPUS" | grep -qi nvidia; then
  echo "→ NVIDIA GPU detected."
  DRIVERS+=("nvidia" "nvidia-utils" "nvidia-settings")
fi

# Summary
echo ""
echo "Packages to install: ${DRIVERS[*]}"

# Confirm and install
read -rp "Install these drivers now? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  sudo pacman -S --needed "${DRIVERS[@]}"
else
  echo "Installation skipped."
fi

