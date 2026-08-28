# DG01

A minimal monochrome Hyprland rice for Gentoo Linux.

> Monochrome simple daily-driver configuration 

## Video


https://github.com/user-attachments/assets/e5e3d675-07ad-483b-b6fd-7469da521dce


## Features

- Gentoo Linux
- Hyprland
- Waybar
- Wofi
- Kitty
- Dunst
- Hyprpaper
- Thunar
- Yazi
- Starship
- Screenshot and screen-recording helpers


## Dependencies

Core desktop packages:

- `gui-wm/hyprland`, `gui-apps/hyprpaper`, `gui-apps/waybar`, `gui-apps/wofi`
- `x11-terms/kitty`, `x11-misc/dunst`, `xfce-base/thunar`, `app-misc/yazi`
- `app-shells/starship`, `gnome-extra/polkit-gnome`, `x11-themes/bibata-xcursors`
- `sys-power/brightnessctl`

Media and utility packages:

- `gui-apps/grim`, `gui-apps/slurp`, `gui-apps/wl-clipboard`, `gui-apps/wf-recorder`
- `media-video/pipewire`, `media-video/wireplumber`, `media-libs/libpulse`, and `media-sound/pavucontrol`
- `x11-libs/libnotify` and `net-misc/networkmanager`

The screenshot helper needs `libnotify` for `notify-send`; the recording helper uses `pactl` to select the default PipeWire sink monitor.

## Fonts

- JetBrainsMono Nerd Font

## Installation

### Quick start

On a new Gentoo user account, clone the repository and run the installer:

```bash
git clone https://github.com/danvraz/gentoo-rice.git
cd gentoo-rice
./install.sh --install-packages
~/.local/bin/start-datum
```

If the packages are already installed, use `./install.sh` instead. The installer refuses to overwrite existing configuration. To move conflicts into `~/.local/share/datum-backups/` first, use `./install.sh --backup-existing`.

To install the documented Gentoo package set as part of setup, run:

```bash
./install.sh --install-packages
```

It uses the complete `packages/gentoo-packages.txt` manifest with `emerge --ask --getbinpkg=y`, so Portage still shows the exact package plan and asks before changing the system. A five-minute install depends on a configured binary package source; compiling Hyprland and its dependencies from source will take longer.

Datum expects a systemd-based session because its power menu uses `systemctl`. Install a JetBrainsMono Nerd Font (or another Nerd Font) for the intended icons.

### Manual installation

Copy the configuration directories into `~/.config`, including the wallpaper shipped at `hypr/wallpapers/3.png`:

```bash
cp -r hypr waybar wofi kitty dunst yazi ~/.config/
cp starship.toml ~/.config/starship.toml
install -Dm755 bin/screenshot bin/record-screen bin/start-datum -t ~/.local/bin/
```

Ensure `~/.local/bin` is on your `PATH`, then add the following to your interactive Bash configuration if you use Bash:

```bash
eval "$(starship init bash)"
```

This rice uses Hyprland's Lua configuration. Start it with:

```bash
Hyprland --config ~/.config/hypr/hyprland.lua
```

`Super+P` opens the Wofi power menu, `Super+Print` takes a selected-area screenshot, and `Super+Shift+R` toggles screen recording. Hyprpaper uses the shipped wallpaper as a fallback for every output, and its path uses `$HOME` rather than a username-specific directory.

## Credits & Inspiration

This rice makes use of and draws inspiration from a few great open-source projects:

- [**VinZ**](https://github.com/vinz-ux/VinZ) — A terminal graphics engine by [@vinz-ux](https://github.com/vinz-ux), which I use as part of my setup.
- [**fetch**](https://github.com/areofyl/fetch) — A 3D system information fetch tool by [@areofyl](https://github.com/areofyl), used in my terminal setup.
- [**flow**](https://github.com/programmersd21/flow) — A terminal application I use as part of my workflow.
- [**diinki-retrofuture**](https://github.com/diinki/diinki-retrofuture) — I took inspiration from [@diinki](https://github.com/diinki)'s Waybar configuration while developing my own.

Huge thanks to the developers of these projects for making and sharing their work.

## License

Released under the MIT License.
