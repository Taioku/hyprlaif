yay -S --noconfirm \
  linux-zen
echo "MANUALLY SWITCH KERNEL IM TOO LAZY RN"

# add this to /etc/environment
# RADV_PERFTEST=aco


cp /etc/pacman.conf /etc/pacman.conf.bak
sudo sed -i '
  /^#\s*\[multilib\]/{
    N
    /^\#\s*\[multilib\]\n#\s*Include = \/etc\/pacman\.d\/mirrorlist$/ {
      s/^#\s*\[multilib\]/[multilib]/
      s/\n#\s*Include = \/etc\/pacman\.d\/mirrorlist/\nInclude = \/etc\/pacman.d\/mirrorlist/
    }
  }
' /etc/pacman.conf

yay -S --noconfirm \
  lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

# Wine
yay -S --noconfirm \
  wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris

yay -S --noconfirm \
  gamemode lib32-gamemode

yay -S --noconfirm \
  meson systemd git dbus
