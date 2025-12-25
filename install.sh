#!/usr/bin/env bash

REPO_URL="https://github.com/jaycedam/nix.git"
REPO_DIR="$HOME/dev/nix"

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

if [ -d "$REPO_DIR" ]; then
    echo -e "$ARROW Directory $REPO_DIR already exists. ${YELLOW}Skipping...${NC}"
else
    echo -e "$ARROW Cloning repository $REPO_URL to $REPO_DIR..."
    git clone "$REPO_URL" "$REPO_DIR" || {
        echo -e "$ARROW ${RED}Error:${NC} Failed to clone repository!"
        exit 1
    }
fi

echo -e "$ARROW Rebuilding NixOS configuration..."
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake "$REPO_DIR"#nixos

echo -e "${ARROW} ${GREEN}Done!${NC} Reboot to apply all changes."
