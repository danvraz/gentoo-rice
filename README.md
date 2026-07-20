# Datum

A minimal monochrome Hyprland rice built on Gentoo Linux.

> My personal daily-driver configuration focused on simplicity, performance and software engineering.

## Features

- Gentoo Linux
- Hyprland
- Waybar
- Wofi
- Kitty
- Dunst
- Hyprpaper
- Thunar

## Screenshots

### Desktop

![Desktop](screenshots/desktop.png)

### Launcher

![Launcher](screenshots/launcher.png)

## Wallpaper

The wallpaper is included in this repository:

```
wallpapers/3.png
```

My personal configuration references:

```
/home/dan/wallpapers/3.png
```

If you're using these dotfiles, either:

- place the wallpaper at the same location, or
- edit `hypr/hyprpaper.conf` to point to your wallpaper directory.

## Fonts

- JetBrainsMono Nerd Font

## Installation

Copy the configuration directories into your `~/.config` directory.

```bash
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r kitty ~/.config/
cp -r dunst ~/.config/
```

## License

Released under the MIT License.
