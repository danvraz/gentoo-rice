#!/bin/sh

# Install Datum without overwriting an existing desktop configuration by default.
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_home=${XDG_CONFIG_HOME:-"$HOME/.config"}
local_bin=${HOME}/.local/bin
data_home=${XDG_DATA_HOME:-"$HOME/.local/share"}
backup_existing=false
install_packages=false

usage() {
    cat <<'EOF'
Usage: ./install.sh [--backup-existing] [--install-packages]

  --backup-existing  Move conflicting configuration into a timestamped backup.
  --install-packages Request the Gentoo package set through emerge first.
EOF
}

for argument in "$@"; do
    case "$argument" in
        --backup-existing) backup_existing=true ;;
        --install-packages) install_packages=true ;;
        --help|-h) usage; exit 0 ;;
        *) printf 'Unknown option: %s\n' "$argument" >&2; usage >&2; exit 2 ;;
    esac
done

if "$install_packages"; then
    command -v emerge >/dev/null 2>&1 || {
        printf 'emerge was not found; install the package list manually.\n' >&2
        exit 1
    }

    # The manifest is maintained in this repository and contains one atom per line.
    sed -e '/^[[:space:]]*#/d' -e '/^[[:space:]]*$/d' \
        "$repo_dir/packages/gentoo-packages.txt" | \
        xargs -r sudo emerge --ask --getbinpkg=y
fi

for directory in hypr waybar wofi kitty dunst yazi; do
    destination="$config_home/$directory"
    if [ -e "$destination" ] && ! "$backup_existing"; then
        printf '%s already exists. Re-run with --backup-existing to preserve it safely.\n' \
            "$destination" >&2
        exit 1
    fi
done

if [ -e "$config_home/starship.toml" ] && ! "$backup_existing"; then
    printf '%s already exists. Re-run with --backup-existing to preserve it safely.\n' \
        "$config_home/starship.toml" >&2
    exit 1
fi

if "$backup_existing"; then
    backup_root="$data_home/datum-backups/$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup_root"

    for directory in hypr waybar wofi kitty dunst yazi; do
        destination="$config_home/$directory"
        [ -e "$destination" ] && mv "$destination" "$backup_root/"
    done
    [ -e "$config_home/starship.toml" ] && mv "$config_home/starship.toml" "$backup_root/"
    printf 'Existing configuration backed up to %s\n' "$backup_root"
fi

mkdir -p "$config_home" "$local_bin"
for directory in hypr waybar wofi kitty dunst yazi; do
    cp -R "$repo_dir/$directory" "$config_home/"
done
install -Dm644 "$repo_dir/starship.toml" "$config_home/starship.toml"
install -Dm755 "$repo_dir/bin/screenshot" "$repo_dir/bin/record-screen" \
    "$repo_dir/bin/start-datum" -t "$local_bin"

printf '\nDatum installed.\n'
printf 'Start it from a TTY with: %s/start-datum\n' "$local_bin"
printf 'For the Starship prompt, add this to your interactive shell: eval "$(starship init bash)"\n'
printf 'The power menu requires a systemd-based session for shutdown, reboot, and logout.\n'
