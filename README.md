# Hyprlaif
From Arch ISO to Hyprland, full personal guide to get hyprland up and going.

In this guide i will be using:  
- [**Hyprland Wiki**](https://wiki.hypr.land/)
- [**mjkstra**](https://github.com/mjkstra)'s arch installation guide [**\***](https://github.com/login/oauth/authorize?client_id=7e0a3cd836d3e544dbd9&redirect_uri=https%3A%2F%2Fgist.github.com%2Fauth%2Fgithub%2Fcallback%3Freturn_to%3Dhttps%253A%252F%252Fgist.github.com%252Fmjkstra%252F96ce7a5689d753e7a6bdd92cdc169bae&response_type=code&state=82c02c7f7de6377f5ca6525534b6c1f05a317cecf7f637d85ed19eb62c84c38b)
- [**tuxslack's**](https://github.com/tuxslack) win10-style-waybar [**\***](https://github.com/tuxslack/win10-style-waybar/tree/main?tab=readme-ov-file#MIT-1-ov-file)
- [**Win 11**](https://www.gnome-look.org/p/2278411) GTK Theme
- [**Win 11**](https://www.gnome-look.org/p/1546069) icon theme [**\***](https://github.com/yeyushengfan258/Win11-icon-theme)
- [**Bibaa Modern Ice**](https://www.gnome-look.org/p/1197198) cursor theme [**\***](https://github.com/ful1e5/Bibata_Cursor)
- [**creatiflux**](https://creatiflux.artstation.com/)'s wallpapers

# Arch Linux Install
## Default Install
1. follow mjkstra's [guide](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae)
2. Skip [Setting up a graphical environment](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#setting-up-a-graphical-environment)
3. Install hyprland and requirements
```
run install script
```
4. Dont forget to add yourself to wheel group
```
sudo useradd -mG wheel $YOUR_USERNAME
```

## Using archinstall Script
1. Make a **[minimal]** installation with **[multilib]**, **[pipewire]** and **[linux-zen]** kernel, then you can skip to [Aur helper](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#aur-helper-and-additional-packages-installation) step
2. Skip [Setting up a graphical environment](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#setting-up-a-graphical-environment)
3. Install hyprland and requirements
```
run install script
```
4. Skip video drivers on [Gaming](https://gist.github.com/mjkstra/96ce7a5689d753e7a6bdd92cdc169bae#gaming) step
5. Dont forget to add yourself to wheel group
```
sudo useradd -mG wheel $YOUR_USERNAME
```  
###### Thanks again [mjkstra](https://github.com/mjkstra) for this beautiful guide!

