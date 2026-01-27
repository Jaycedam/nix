#!/usr/bin/env bash
set -e

DISTRO=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"' | cut -d' ' -f1 | tr '[:upper:]' '[:lower:]')
DIR="${HOME}/dev/nix"
WALLPAPER="$DIR/wall/default.jpg"
BRANCH=""

while getopts "b:h" opt; do
    case $opt in
    b)
        BRANCH="$OPTARG"
        ;;
    h)
        echo "Usage: $0 [-b branch]"
        echo "  -b branch    Git branch to switch to after cloning"
        exit 0
        ;;
    *)
        echo "Usage: $0 [-b branch]"
        exit 1
        ;;
    esac
done

sudo_check() {
    echo "Verifying sudo access..."
    if ! sudo -v; then
        echo "Error: Sudo access required"
        exit 1
    fi

    # Keep sudo access alive during long operations
    (
        while true; do
            sudo -n true 2>/dev/null
            sleep 60
            kill -0 "$$" || exit 0
        done
    ) &
    SUDO_KEEPER_PID=$!
    trap 'kill $SUDO_KEEPER_PID 2>/dev/null || true' EXIT
}

clone_config() {
    echo "Cloning configuration repository..."
    if [ -d "${DIR}/.git" ]; then
        echo "WARNING: ${DIR} already exists. If the script fails, rename or remove the existing directory."
    else
        nix-shell -p git --run "git clone https://github.com/jaycem-dev/nix.git ${DIR}" >/dev/null
    fi

    if [ -n "$BRANCH" ]; then
        echo "Switching to branch: ${BRANCH}..."
        cd "${DIR}"
        if ! git switch "${BRANCH}" >/dev/null; then
            echo "Error: Failed to switch to branch '${BRANCH}'"
            exit 1
        fi
    fi
}

install_nix() {
    if ! command -v nix >/dev/null 2>&1; then
        echo "Installing Nix..."
        curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
        # shellcheck disable=SC1091
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    else
        echo "Nix is already installed."
    fi
}

fedora_settings() {
    echo "Suppressing TTY console logs..."
    sudo dmesg --console-off >/dev/null

    echo "Setting TTY font size for HiDPI displays..."
    sudo setfont solar24x32 >/dev/null
    sudo tee /etc/vconsole.conf >/dev/null <<EOF
FONT=solar24x32
EOF

    echo "Setting Colemak-DH keyboard layout..."
    sudo localectl set-keymap us-colemak_dh_iso >/dev/null

    echo "Creating i2c group for external monitor control..."
    sudo groupadd i2c 2>/dev/null || true
    sudo usermod -aG i2c "$(whoami)" >/dev/null

    echo "Making SELinux permissive to enable GPU drivers for nixpkgs..."
    sudo setenforce 0 >/dev/null
    sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config >/dev/null
}

fedora_pkgs() {
    echo "Upgrading system packages..."
    sudo dnf upgrade -y >/dev/null

    # Util for using COPR
    sudo dnf install dnf-plugins-core -y >/dev/null

    echo "Adding keyd repository..."
    sudo dnf copr enable alternateved/keyd -y >/dev/null
    echo "Adding Hyprland repository..."
    sudo dnf copr enable solopasha/hyprland -y >/dev/null
    echo "Installing niri compositor..."
    sudo dnf install --setopt=install_weak_deps=False niri -y >/dev/null

    echo "Installing desktop dependencies..."
    sudo dnf install xdg-desktop-portal-gnome gnome-keyring pipewire tuned hyprlock keyd -y >/dev/null

    echo "Enabling services..."
    systemctl --user enable --now pipewire.service >/dev/null
    systemctl --user enable --now pipewire-pulse.service >/dev/null
    sudo systemctl enable --now tuned >/dev/null
    sudo systemctl enable --now keyd >/dev/null

    echo "Copying keyd config..."
    sudo mkdir -p /etc/keyd >/dev/null
    sudo tee /etc/keyd/default.conf >/dev/null <<EOF
[ids]
*
[main]
a = overloadt(alt, a, 200)
s = overloadt(meta, s, 200)
d = overloadt(shift, d, 200)
f = overloadt(control, f, 200)
j = overloadt(control, j, 200)
k = overloadt(shift, k, 200)
l = overloadt(meta, l, 200)
; = overloadt(alt, ;, 200)
f1 = brightnessdown
f2 = brightnessup
f7 = previoussong
f8 = playpause
f9 = nextsong
f10 = mute
f11 = volumedown
f12 = volumeup
space = overloadt(nav_layer, space, 200)
[nav_layer]
h = left
j = down
k = up
l = right
w = C-right
t = C-left
i = backspace
; = enter
f1 = f1
f2 = f2
f7 = f7
f8 = f8
f9 = f9
f10 = f10
f11 = f11
f12 = f12
EOF

}

if [ "$DISTRO" = "nixos" ]; then
    echo "Detected NixOS..."
    sudo_check
    clone_config

    # Switch to NixOS configuration
    sudo NIX_CONFIG="experimental-features = nix-command flakes" \
        nixos-rebuild switch --flake ~/dev/nix#nixos-niri

elif [ "$DISTRO" = "fedora" ]; then
    echo "Detected Fedora..."
    sudo_check
    fedora_settings
    fedora_pkgs
    install_nix
    clone_config

    echo "Applying home-manager configuration..."
    nix run github:nix-community/home-manager/master -- switch -b backup --flake "${DIR}"#jay-niri-arm

    echo "Enabling GPU driver access..."
    sudo "$(which non-nixos-gpu-setup)" >/dev/null
else
    echo "Error: Unsupported distro: $DISTRO"
    exit 1
fi

echo "Setting default theme with Matugen..."
matugen image "$WALLPAPER" &>/dev/null

echo "Done! Reboot to apply all changes."
