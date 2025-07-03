# Hyprland Keybindings

---

## 📌 Main Modifier

- `$mainMod` is set to `SUPER` (the `Windows` key).

---

## ⚙️ General Keybindings

| Keys                  | Action                                         |
|-----------------------|------------------------------------------------|
| `$mainMod + RETURN`   | Launch terminal (`$terminal`)                  |
| `$mainMod + R`        | Launch application menu (`$menu`)              |
| `$mainMod + B`        | Launch browser (`$browser`)                    |
| `$mainMod + E`        | Launch file manager (`$fileManager`)           |
| `$mainMod + M`        | Exit Hyprland session                          |
| `$mainMod + C`        | Kill the active window                         |
| `$mainMod + V`        | Toggle floating mode for active window         |
| `$mainMod + F`        | Toggle fullscreen mode                         |
| `$mainMod + ALT + P`  | Refresh Waybar script                          |
| `$mainMod + H`        | Launch `btop` in kitty terminal                |

---

## 🪟 Window Management

### Focus Movement

| Keys                     | Direction                  |
|--------------------------|----------------------------|
| `$mainMod + Left`        | Move focus left            |
| `$mainMod + Right`       | Move focus right           |
| `$mainMod + Up`          | Move focus up              |
| `$mainMod + Down`        | Move focus down            |

### Move Windows

| Keys                           | Direction                  |
|--------------------------------|----------------------------|
| `$mainMod + CTRL + Left`       | Move window left           |
| `$mainMod + CTRL + Right`      | Move window right          |
| `$mainMod + CTRL + Up`         | Move window up             |
| `$mainMod + CTRL + Down`       | Move window down           |

### Resize Windows

| Keys                          | Action                      |
|-------------------------------|-----------------------------|
| `$mainMod + ALT + Left`       | Shrink window horizontally  |
| `$mainMod + ALT + Right`      | Grow window horizontally    |
| `$mainMod + ALT + Up`         | Shrink window vertically    |
| `$mainMod + ALT + Down`       | Grow window vertically      |

### Mouse Bindings

| Keys                      | Action             |
|---------------------------|--------------------|
| `$mainMod + Left Click`   | Move window        |
| `$mainMod + Right Click`  | Resize window      |

### Other

| Keys                   | Action                                    |
|------------------------|-------------------------------------------|
| `$mainMod + SPACE`     | Center active window                      |
| `$mainMod + X`         | Bring active window to top                |
| `$mainMod + P`         | Toggle pseudo tiling mode                 |
| `$mainMod + J`         | Toggle split layout                       |

---

## 🧩 Workspaces

### Switch Workspaces

| Keys             | Action                    |
|------------------|---------------------------|
| `CTRL + [1–0]`   | Switch to workspace 1–10  |

### Move Window to Workspace

| Keys                 | Action                             |
|----------------------|------------------------------------|
| `$mainMod + [1–0]`   | Send active window to workspace 1–10 |

### Scroll Workspaces

| Keys                    | Action                           |
|-------------------------|----------------------------------|
| `$mainMod + Mouse Down` | Switch to next workspace         |
| `$mainMod + Mouse Up`   | Switch to previous workspace     |

---

## ✨ Special Workspace

| Keys                      | Action                                            |
|---------------------------|---------------------------------------------------|
| `$mainMod + S`            | Toggle `magic` special workspace                  |
| `$mainMod + SHIFT + S`    | Move window to `magic` special workspace          |
| `$mainMod + CONTROL + S`  | Move window to workspace 1                        |

---

## 📸 Screen Capture

| Keys                  | Action                                                |
|-----------------------|-------------------------------------------------------|
| `ALT + SHIFT + S`     | Region screenshot: Select area with `slurp`, save with `grim`, copy to clipboard |

---

## 🎛️ Waybar Controls

Waybar refresh script:
- `$mainMod + ALT + P`: Runs `~/.config/waybar/scripts/refresh.sh`

---

