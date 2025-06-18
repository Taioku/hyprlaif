# Hyprlaif
From Arch ISO to Hyprland, full personal guide to get hyprland up and going.

In this guide i will be using:  
- [**mjkstra**](https://github.com/mjkstra)'s arch installation guide
- [**Hyprland Wiki**](https://wiki.hypr.land/)

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
sudo pacman -S discord steam spotify-launcher
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh
```
