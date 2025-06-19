# Hyprlaif
From Arch ISO to Hyprland, full personal guide to get hyprland up and going.

In this guide i will be using:  
- [**Hyprland Wiki**](https://wiki.hypr.land/)
- [**mjkstra**](https://github.com/mjkstra)'s arch installation guide [**\***](https://github.com/login/oauth/authorize?client_id=7e0a3cd836d3e544dbd9&redirect_uri=https%3A%2F%2Fgist.github.com%2Fauth%2Fgithub%2Fcallback%3Freturn_to%3Dhttps%253A%252F%252Fgist.github.com%252Fmjkstra%252F96ce7a5689d753e7a6bdd92cdc169bae&response_type=code&state=82c02c7f7de6377f5ca6525534b6c1f05a317cecf7f637d85ed19eb62c84c38b)
- [**tuxslack's**](https://github.com/tuxslack) win10-style-waybar [**\***](https://github.com/tuxslack/win10-style-waybar/tree/main?tab=readme-ov-file#MIT-1-ov-file)

# Arch Linux Install
## Default Install
1. follow mjkstra's [guide](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae)
2. Skip [Setting up a graphical environment](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#setting-up-a-graphical-environment)
3. Install hyprland and requirements
```
sudo pacman -S --needed hyprland wayland kitty dolphin btop wofi waybar swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland pipewire pulsemixer
```

## Using archinstall Script
1. Make a **[minimal]** installation with **[multilib]** and **[pipewire]**, then you can skip to [Aur helper](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#aur-helper-and-additional-packages-installation) step
2. Skip [Setting up a graphical environment](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#setting-up-a-graphical-environment)
3. Install hyprland and requirements
```
sudo pacman -S --needed hyprland wayland kitty dolphin btop wofi waybar swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland pipewire pulsemixer
```
4. Skip video drivers on [Gaming](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#gaming) step
5. Dont forget to add yourself to wheel group
```
sudo useradd -mG wheel $YOUR_USERNAME
```

# I NEED TO ADD EXEC-ONCE IN HYPRLAND COFIG FILE
###### Thanks again [mjkstra](https://github.com/mjkstra) for this beautiful guide!


### IF WAYBAR
```
sudo pacman -S ttf-martian-mono-nerd
```


# Optional Installs
```
sudo pacman -S discord steam spotify-launcher obsidian unzip asciiquarium eza fastfetch hyprpaper nwg-look
yay -S waypaper cmake meson cpio pkg-config git g++ gcc
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprbars
hyprpm enable hyprexpo
```

> after login in spotify, run `spicetify backup apply`
