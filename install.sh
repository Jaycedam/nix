#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/jaycedam/nix.git"
TARGET_DIR="$HOME/dev/nix"
SOURCE="$TARGET_DIR/configuration.nix"
NIXOS_CONFIG="/etc/nixos/configuration.nix"

# Colors
YELLOW='\033[1;33m'
RED='\033[1;31m'
GREEN='\033[1;32m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

# Arrow
ARROW="${MAGENTA}➜${NC}"

echo -e "$ARROW Requesting sudo access..."
sudo -v

# Keep sudo alive until the script exits
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

if [ -d "$TARGET_DIR" ]; then
    echo -e "$ARROW Directory $TARGET_DIR already exists. ${YELLOW}Skipping...${NC}"
else
    echo -e "$ARROW Cloning repository $REPO_URL to $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR" || {
        echo -e "$ARROW ${RED}Error:${NC} Failed to clone repository!"
        exit 1
    }
fi

cd "$TARGET_DIR"

echo -e "$ARROW Checking for configuration.nix..."
if [ ! -f "$SOURCE" ]; then
    echo -e "$ARROW ${RED}Error:${NC} configuration.nix not found in repository"
    exit 1
fi

if [ -L "$NIXOS_CONFIG" ] && [ "$(readlink -f "$NIXOS_CONFIG")" = "$SOURCE" ]; then
    echo -e "$ARROW configuration.nix already symlinked. ${YELLOW}Skipping...${NC}"
else
    echo -e "$ARROW Creating symlink for configuration.nix..."
    sudo ln -sfv "$SOURCE" "$NIXOS_CONFIG"
fi

echo -e "$ARROW Rebuilding NixOS configuration..."
sudo nixos-rebuild switch

echo -e "$ARROW ${GREEN}Done!${NC} Reboot to apply all changes."
