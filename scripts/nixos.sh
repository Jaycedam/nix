#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(dirname "$0")" # Get script directory
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

# Source and run git clone script
source "${SCRIPT_DIR}/git-clone.sh" "${DIR}" "${BRANCH}"

# Switch to NixOS configuration
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake ~/dev/nix#nixos-niri

echo "Done! Reboot to apply all changes."
