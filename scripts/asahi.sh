#!/usr/bin/env bash
set -e

DIR="${HOME}/dev/nix"
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

echo "Verifying sudo access..."
sudo -v

echo "Suppressing TTY console logs..."
sudo dmesg --console-off

echo "Setting TTY font size for HiDPI displays..."
sudo setfont solar24x32

echo "Setting Colemak-DH keyboard layout..."
sudo localectl set-keymap us-colemak_dh_iso

echo "Setting up Hyprlock's PAM config..."
sudo tee /etc/pam.d/hyprlock >/dev/null <<EOF
auth include login
account include login
session include login
EOF

echo "Setting up keyd config..."
sudo mkdir -p /etc/keyd
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

echo "Upgrading system packages..."
sudo dnf upgrade -y

# Util for using COPR
sudo dnf install dnf-plugins-core -y

echo "Adding Hyprland repository..."
sudo dnf copr enable solopasha/hyprland -y

echo "Adding keyd repository..."
sudo dnf copr enable alternateved/keyd -y

echo "Installing niri compositor..."
sudo dnf install --setopt=install_weak_deps=False niri -y

echo "Installing desktop dependencies..."
sudo dnf install xdg-desktop-portal-gnome gnome-keyring pipewire keyd tuned -y

if ! command -v nix >/dev/null 2>&1; then
    echo "Installing Nix..."
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
    # shellcheck disable=SC1091
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
else
    echo "Nix is already installed."
fi

echo "Cloning configuration repository..."
if [ -d "${DIR}/.git" ]; then
    echo "WARNING: ${DIR} already exists. If the script fails, rename or remove the existing directory."
else
    nix-shell -p git --run "git clone https://github.com/jaycedam/nix.git ${DIR}"
fi

if [ -n "$BRANCH" ]; then
    echo "Switching to branch: ${BRANCH}..."
    cd "${DIR}"
    git switch "${BRANCH}"
fi

echo "Creating i2c group for external monitor control..."
sudo groupadd i2c 2>/dev/null || true
sudo usermod -aG i2c "$(whoami)"

# Disable SELinux to allow GPU driver symlink for nixpkgs
echo "Disabling SELinux to allow target.genericLinux.enable (Home Manager)..."
sudo setenforce 0

echo "Applying home-manager configuration..."
nix run github:nix-community/home-manager/master -- switch -b backup --flake "${DIR}"#jay-niri-arm

echo "Enabling services..."
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
sudo systemctl enable --now keyd
sudo systemctl enable --now tuned

echo "Enabling GPU driver access..."
sudo "$(which non-nixos-gpu-setup)"

echo "Done! Reboot to apply all changes."
