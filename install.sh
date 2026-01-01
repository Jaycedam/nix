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

# Valid hosts
valid_hosts=("darwin" "nixos-hyprland")

# Check for exactly one argument
if [ $# -eq 0 ]; then
    echo -e "$ARROW ${YELLOW}Warning:${NC} No host provided. Options are: ${valid_hosts[*]}"
    echo -e "$ARROW Usage: $0 <host>"
    exit 1
elif [ $# -gt 1 ]; then
    echo -e "$ARROW ${RED}Error:${NC} Too many arguments. Expected exactly one host."
    echo -e "$ARROW Usage: $0 <host>"
    exit 1
fi

# Get host from first argument
host="$1"

# Validate host
if [ "$host" != "darwin" ] && [ "$host" != "nixos-hyprland" ]; then
    echo -e "$ARROW ${RED}Error:${NC} Invalid host '$host'. Valid options are: ${valid_hosts[*]}"
    exit 1
fi

echo -e "$ARROW Requesting sudo access..."
sudo -v

# Keep sudo alive until the script exits
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Darwin-specific setup
if [ "$(uname -s)" = "Darwin" ]; then
    if ! command -v nix >/dev/null 2>&1; then
        echo -e "$ARROW Installing Nix package manager..."
        sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
    fi
    echo -e "$ARROW Activating Nix..."
    # shellcheck disable=SC1091
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    if [ -f /etc/zshrc.before-nix-darwin ] || [ -f /etc/bashrc.before-nix-darwin ]; then
        echo -e "$ARROW ${YELLOW}Warning:${NC} Backup files /etc/zshrc.before-nix-darwin and/or /etc/bashrc.before-nix-darwin already exist."
        echo -e "$ARROW Please handle backups manually and run the script again."
        exit 1
    fi
    echo -e "$ARROW Backing up /etc files..."
    sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin 2>/dev/null || true
    sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin 2>/dev/null || true
fi

if [ -d "$REPO_DIR" ]; then
    echo -e "$ARROW Directory $REPO_DIR already exists. ${YELLOW}Skipping...${NC}"
else
    echo -e "$ARROW Cloning repository $REPO_URL to $REPO_DIR..."
    git clone "$REPO_URL" "$REPO_DIR" || {
        echo -e "$ARROW ${RED}Error:${NC} Failed to clone repository!"
        exit 1
    }
fi

echo -e "$ARROW Rebuilding $host configuration..."

if [ "$(uname -s)" = "Darwin" ]; then
    echo -e "$ARROW Rebuilding Darwin configuration..."
    sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake "$REPO_DIR#$host"
else
    echo -e "$ARROW Rebuilding NixOS configuration..."
    sudo NIX_CONFIG="experimental-features = nix-command flakes" \
        nixos-rebuild switch --flake "$REPO_DIR#$host"
fi

echo -e "${ARROW} ${GREEN}Done!${NC} Reboot to apply all changes."
