#!/usr/bin/env bash
set -e

echo "Verifying sudo access..."
sudo -v

echo "Suppressing TTY console logs..."
sudo dmesg --console-off

echo "Setting TTY font size for HiDPI displays..."
sudo setfont solar24x32

echo "Setting Colemak-DH keyboard layout..."
sudo localectl set-keymap us-colemak_dh_iso

echo "Upgrading system packages..."
sudo dnf upgrade -y

echo "Installing compositor and dependencies..."
sudo dnf install --setopt=install_weak_deps=False niri xdg-desktop-portal-gnome gnome-keyring -y

echo "Installing Nix..."
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

echo "Cloning configuration repository..."
nix-shell -p git --run "git clone https://github.com/jaycedam/nix.git ~/dev/nix"

echo "Applying home-manager configuration..."
nix run github:nix-community/home-manager/master -- switch -b backup --flake ~/dev/nix#jay-niri-arm

echo "Setup complete!"
