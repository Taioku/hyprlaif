# 🗔 Hyprlaif

**From Arch ISO to Hyprland** - A complete personal guide for setting up my Hyprland dotfiles.

## 🧩 Components Used

This setup incorporates the following components:

- 📚 [**Hyprland Wiki**](https://wiki.hypr.land/) - Official documentation and configuration guide
- 🎯 [**tuxslack's Win10-style Waybar**](https://github.com/tuxslack/win10-style-waybar) - Windows 10 inspired status bar
- 🎨 [**Win 11 GTK Theme**](https://www.gnome-look.org/p/2278411) - Windows 11 styled GTK theme ([GitHub](https://github.com/yeyushengfan258/Win11-gtk-theme))
- 🔗 [**Win 11 Icon Theme**](https://www.gnome-look.org/p/1546069) - Windows 11 icon pack ([GitHub](https://github.com/yeyushengfan258/Win11-icon-theme))
- 🖱️ [**Bibata Modern Ice**](https://www.gnome-look.org/p/1197198) - Modern cursor theme ([GitHub](https://github.com/ful1e5/Bibata_Cursor))
- 🖼️ [**creatiflux**](https://creatiflux.artstation.com/) - Wallpaper collection

# ⚠️ Important Warning

---
> **🚨 DO NOT DELETE THE HYPRLAIF FOLDER AFTER INSTALLATION!**
> 
> The hyprlaif folder contains the source files that are linked to your system configuration. Deleting this folder will break your setup and remove your configuration backups.

---

# 🚀 Installation

### 1. Arch Base Installation

Use the `archinstall` script to create a minimal Arch Linux installation:

- Select **minimal** installation profile
- Enable **multilib** repository
- Choose **linux-zen** kernel
- Complete installation and reboot

### 2. User Configuration

Add your user to the wheel group for sudo privileges:

```bash
sudo useradd -mG wheel $YOUR_USERNAME
```

### 3. Hyprland Setup

Clone this repository and run the installation script:

```bash
git clone https://github.com/Taioku/hyprlaif.git && cd hyprlaif && ./install.sh
```

# 📦 What Gets Installed

The installation script will install these packages:

| Category | Packages |
|----------|----------|
| 🌊 Hyprland Core | hyprland, xdg-desktop-portal-hyprland, hyprpolkitagent, qt5-wayland, qt6-wayland |
| 🔊 Audio System | pipewire, pipewire-pulse, wireplumber, pulsemixer |
| 🌐 Network & Connectivity | networkmanager, bluez, bluez-utils, blueman |
| 📸 Screenshots & Clipboard | wl-clipboard, grim, slurp, swappy |
| 🎨 Desktop Environment | dunst, waybar, wofi, kitty, thunar |
| 🛠️ System Utilities | unzip, wget, neovim, yazi, btop, fastfetch, zoxide, fzf, eza, feh |
| 🖼️ Wallpaper Management | waypaper, hyprpaper |
| 🔤 Fonts | ttf-jetbrains-mono-nerd, ttf-twemoji |
| 🎭 Theming | nwg-look, gnome-themes-extra, gtk-engine-murrine, sassc |
| 🧮 Applications | calc, mate-calc, bash-completion, mplayer |
| 🎮 Fun Extras | lolcat, pipes.sh, bonsai.sh, asciiquarium, cava, cxxmatrix |

# ⚙️ Configuration Files

All configuration files are located in `hyprlaif/.config`:

### Hyprland - `hyprlaif/.config/hypr/`
The heart of the desktop environment, managing windows, workspaces, and system behavior.

| File | Purpose |
|------|---------|
| `animations.conf` | Animation settings and effects |
| `autostart.conf` | Programs to launch at startup |
| `environmentvariables.conf` | Environment variable definitions |
| `hyprland.conf` | Main Hyprland configuration |
| `hyprpaper.conf` | Wallpaper management settings |
| `input.conf` | Input device configurations |
| `keybindings.conf` | Custom keyboard shortcuts |
| `layerrules.conf` | Layer-specific window rules |
| `looknfeel.conf` | Visual appearance settings |
| `monitors.conf` | Multi-monitor configurations |
| `variables.conf` | Custom variables and definitions |
| `windowrules.conf` | Window behavior rules |
| `windowsnworkspaces.conf` | Workspace and window management |

### fastfetch - `hyprlaif/.config/fastfetch/`
System information display tool for showcasing your setup.

| File | Purpose |
|------|---------|
| `config.jsonc` | Main fastfetch configuration with display modules and formatting |

### kitty - `hyprlaif/.config/kitty/`
GPU-accelerated terminal emulator configuration.

| File | Purpose |
|------|---------|
| `kitty.conf` | Terminal emulator settings, fonts, colors, and key bindings |

### waybar - `hyprlaif/.config/waybar/`
Customizable status bar for Wayland compositors.

| File | Purpose |
|------|---------|
| `config` | Main waybar configuration with modules and layout settings |
| `style.css` | Styling and appearance customization for waybar elements |

### wofi - `hyprlaif/.config/wofi/`
Application launcher and menu system.

| File | Purpose |
|------|---------|
| `config` | Application launcher configuration and behavior settings |
| `style.css` | Visual styling and theme customization for wofi interface |

# ⌨️ Keybindings

For a complete overview of all custom keybindings, including workspace controls, window management, and special commands, see [KEYBINDINGS.md](.config/hypr/KEYBINDINGS.md).
