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

# Switch to NixOS configuration
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake ~/dev/nix#nixos-niri

echo "Done! Reboot to apply all changes."
