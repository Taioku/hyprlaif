#!/usr/bin/env bash

# ── GPU Driver Installer for Arch with 32-bit support ───────────

GPUS=$(lspci | grep -E "VGA|3D")

echo "Detected GPU(s):"
echo "$GPUS"
echo ""

DRIVERS=()

# Common libs for all GPUs
COMMON_PKGS=(libglvnd lib32-libglvnd)

# Intel
if echo "$GPUS" | grep -qi intel; then
  echo "→ Intel GPU detected."
  DRIVERS+=("mesa" "vulkan-intel" "libva-mesa-driver" "mesa-vdpau")
fi

# AMD
if echo "$GPUS" | grep -qi amd; then
  echo "→ AMD GPU detected."
  DRIVERS+=("mesa" "vulkan-radeon" "libva-mesa-driver" "mesa-vdpau" "linux-firmware")
fi

# NVIDIA
if echo "$GPUS" | grep -qi nvidia; then
  echo "→ NVIDIA GPU detected."
  DRIVERS+=("nvidia" "nvidia-utils" "nvidia-settings")
fi

# Add common libs at the end to avoid duplicates
DRIVERS+=("${COMMON_PKGS[@]}")

# Remove duplicates
# (bash 4+ needed)
mapfile -t DRIVERS < <(printf '%s\n' "${DRIVERS[@]}" | sort -u)

echo ""
echo "Packages to install: ${DRIVERS[*]}"

read -rp "Install these drivers now? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  sudo pacman -S --needed "${DRIVERS[@]}"
else
  echo "Installation skipped."
fi

