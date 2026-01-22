#!/usr/bin/env bash
set -e

NIX_DIR="${HOME}/dev/nix"
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

echo "Upgrading system packages..."
sudo dnf upgrade -y

echo "Installing compositor and dependencies..."
sudo dnf install --setopt=install_weak_deps=False niri xdg-desktop-portal-gnome gnome-keyring -y

echo "Installing Nix..."
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

echo "Cloning configuration repository..."
if [ -d "${NIX_DIR}/.git" ]; then
  echo "WARNING: ${NIX_DIR} already exists. If the script fails, rename or remove the existing directory."
else
  nix-shell -p git --run "git clone https://github.com/jaycedam/nix.git ${NIX_DIR}"
fi

if [ -n "$BRANCH" ]; then
  echo "Switching to branch: ${BRANCH}..."
  cd "${NIX_DIR}"
  git switch "${BRANCH}"
fi

echo "Applying home-manager configuration..."
nix run github:nix-community/home-manager/master -- switch -b backup --flake ${NIX_DIR}#jay-niri-arm

echo "Setup complete!"
