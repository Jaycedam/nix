#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/jaycedam/nix.git"
TARGET_DIR="$HOME/dev/nix"
SOURCE="$TARGET_DIR/configuration.nix"
NIXOS_CONFIG="/etc/nixos/configuration.nix"

echo "Requesting sudo access..."
sudo -v

# Keep sudo alive until the script exits
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

echo "Cloning nix repository to $TARGET_DIR..."
if [ -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR already exists, skipping clone."
else
    git clone "$REPO_URL" "$TARGET_DIR" || {
        echo "Error: Failed to clone repository!"
        exit 1
    }
fi

cd "$TARGET_DIR"

echo "Checking for configuration.nix..."
if [ ! -f "$SOURCE" ]; then
    echo "Error: configuration.nix not found in repository"
    exit 1
fi

echo "Creating symlink for configuration.nix..."
if [ -L "$NIXOS_CONFIG" ] && [ "$(readlink -f "$NIXOS_CONFIG")" = "$SOURCE" ]; then
    echo "configuration.nix already correctly symlinked"
else
    echo "Updating configuration.nix symlink"
    sudo ln -sfv "$SOURCE" "$NIXOS_CONFIG"
fi

echo "Rebuilding NixOS configuration..."
sudo nixos-rebuild switch

echo "Done."
