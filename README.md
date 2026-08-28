# Datum

A minimal monochrome Hyprland rice for Gentoo Linux.

> My personal daily-driver configuration focused on simplicity, performance, and software engineering.

## Screenshots


<img width="1599" height="899" alt="WhatsApp Image 2026-07-20 at 23 46 09" src="https://github.com/user-attachments/assets/2ee80d59-ab48-4251-99fc-b111d692c373" />
<img width="1599" height="899" alt="WhatsApp Image 2026-07-20 at 23 46 09 (1)" src="https://github.com/user-attachments/assets/24a661f5-b875-4db5-9b08-09f8dbce7221" />
<img width="1599" height="899" alt="WhatsApp Image 2026-07-20 at 23 46 09 (2)" src="https://github.com/user-attachments/assets/1e58d9b8-264b-4b9f-9dbc-ca8beb04f2ff" />
<img width="1599" height="899" alt="WhatsApp Image 2026-07-20 at 23 46 09 (3)" src="https://github.com/user-attachments/assets/e63db218-a87e-4c1a-90de-c022359adc28" />
<img width="1599" height="899" alt="WhatsApp Image 2026-07-20 at 23 46 10" src="https://github.com/user-attachments/assets/0516224b-245d-431d-a982-3e495b174223" />


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

## License

Released under the MIT License.
