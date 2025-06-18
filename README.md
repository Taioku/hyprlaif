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
sudo pacman -S --needed hyprland wayland kitty dolphin wofi waybar swaync xdg-desktop-portal-hyprland qt5-wayland qt6-wayland
```

## Using archinstall Script
1. Make a **[minimal]** installation with **[multilib]** and **[Pipewire]**, then you can skip to [Aur helper](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#aur-helper-and-additional-packages-installation) step
2. On [Setting up a graphical environment](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#setting-up-a-graphical-environment) step choose [Option 2: Hyprland](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#option-2-hyprland-wip)
3. Skip video drivers on [Gaming](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#gaming) step
4. Dont forget to add yourself to wheel group
```
sudo useradd -mG wheel $YOUR_USERNAME
```

# I NEED TO ADD EXEC-ONCE IN HYPRLAND COFIG FILE
###### Thanks again [mjkstra](https://github.com/mjkstra) for this beautiful guide!
