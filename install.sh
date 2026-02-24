#!/usr/bin/env bash
set -e

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
RESET='\033[0m'
ARROW="${MAGENTA}==>${RESET}"

DISTRO=$(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"' | cut -d' ' -f1 | tr '[:upper:]' '[:lower:]')
DIR="${HOME}/dev/nix"
WALLPAPER="$DIR/assets/wallpaper.jpg"
BRANCH=""
PROFILE=""

if [[ "${1:-}" != -* ]]; then
    PROFILE="#${1}"
    shift
fi

if [[ $# -gt 0 ]]; then
    echo -e "${RED}Error:${RESET} Too many arguments"
    "$0" --help
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
    --branch | -b)
        if [[ -z "${2:-}" ]] || [[ "${2:-}" == --* ]]; then
            echo -e "${RED}Error:${RESET} --branch requires an argument" >&2
            exit 1
        fi
        BRANCH="$2"
        shift 2
        ;;
    --help | -h)
        echo -e "${GREEN}Usage:${RESET} $0 [profile] [options]"
        echo ""
        echo -e "${GREEN}Options:${RESET}"
        echo -e "  ${BLUE}profile${RESET}               Flake profile. On NixOS uses it for nixos-rebuild"
        echo -e "                           (HM as NixOS module); on other distros uses it"
        echo -e "                           for home-manager standalone"
        echo -e "  ${BLUE}--branch${RESET}|-b branch   Git branch to switch to after cloning"
        exit 0
        ;;
    *)
        echo -e "${RED}Error:${RESET} Invalid option"
        echo -e "${GREEN}Usage:${RESET} $0 [profile] [--branch|-b branch]"
        exit 1
        ;;
    esac
done

sudo_check() {
    echo -e "$ARROW Verifying ${BLUE}sudo${RESET} access..."
    if ! sudo -v; then
        echo -e "${RED}Error:${RESET} Sudo access required"
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
    echo -e "$ARROW Cloning configuration repository..."
    if [ -d "${DIR}/.git" ]; then
        echo -e "${YELLOW}WARNING:${RESET} ${DIR} already exists. If the script fails, rename or remove the existing directory."
    else
        nix-shell -p git --run "git clone https://github.com/jaycem-dev/nix.git ${DIR}" >/dev/null
    fi

    if [ -n "$BRANCH" ]; then
        echo -e "$ARROW Switching to ${BLUE}${BRANCH}${RESET} branch..."
        cd "${DIR}"
        if ! git switch "${BRANCH}" >/dev/null; then
            echo -e "${RED}Error:${RESET} Failed to switch to branch '${BRANCH}'"
            exit 1
        fi
    fi
}

install_nix() {
    if ! command -v nix >/dev/null 2>&1; then
        echo -e "$ARROW Installing ${BLUE}Nix${RESET}..."
        curl -fsSL https://install.determinate.systems/nix | sh -s -- install --no-confirm
        # shellcheck disable=SC1091
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    else
        echo -e "$ARROW ${BLUE}Nix${RESET} is already installed."
    fi
}

libinput_quirks() {
    echo -e "$ARROW Setting up ${BLUE}libinput quirks${RESET} for keyd virtual keyboard..."
    sudo mkdir -p /etc/libinput
    sudo tee /etc/libinput/local-overrides.quirks >/dev/null <<EOF
[Serial Keyboards]

MatchUdevType=keyboard
MatchName=keyd*keyboard
AttrKeyboardIntegration=internal
EOF
}

iwd_backend() {
    echo -e "$ARROW Configuring ${BLUE}NetworkManager${RESET} to use ${BLUE}iwd${RESET} as WiFi backend..."
    sudo dnf install iwd -y >/dev/null
    sudo mkdir -p /etc/NetworkManager/conf.d
    sudo tee /etc/NetworkManager/conf.d/wifi-backend.conf >/dev/null <<EOF
[device]
wifi.backend=iwd
EOF
    sudo systemctl enable --now iwd >/dev/null
    sudo systemctl restart NetworkManager >/dev/null
    echo -e "$ARROW Switched to ${BLUE}iwd${RESET} WiFi backend. You may need to reconnect to your network."
}

localsend_firewall() {
    echo -e "$ARROW Configuring ${BLUE}firewall${RESET} for LocalSend..."
    sudo firewall-cmd --permanent --add-port=53317/tcp >/dev/null
    sudo firewall-cmd --permanent --add-port=53317/udp >/dev/null
    sudo firewall-cmd --reload >/dev/null
}

fedora_settings() {
    echo -e "$ARROW Suppressing ${BLUE}TTY${RESET} console logs..."
    sudo dmesg --console-off >/dev/null

    echo -e "$ARROW Setting ${BLUE}TTY font${RESET} size for HiDPI displays..."
    sudo setfont solar24x32 >/dev/null
    sudo tee /etc/vconsole.conf >/dev/null <<EOF
FONT=solar24x32
EOF

    echo -e "$ARROW Setting ${BLUE}Colemak-DH${RESET} keyboard layout..."
    sudo localectl set-keymap us-colemak_dh_iso >/dev/null

    echo -e "$ARROW Creating ${BLUE}i2c${RESET} group for external monitor control..."
    sudo groupadd i2c 2>/dev/null || true
    sudo usermod -aG i2c "$(whoami)" >/dev/null

    echo -e "$ARROW Making ${BLUE}SELinux${RESET} permissive to enable GPU drivers for nixpkgs..."
    sudo setenforce 0 >/dev/null
    sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config >/dev/null
}

set_wallpaper() {
    echo -e "$ARROW Setting default ${BLUE}wallpaper${RESET}..."
    swww img "$WALLPAPER" >/dev/null
}

fedora_pkgs() {
    echo -e "$ARROW Upgrading ${BLUE}system packages${RESET}..."
    sudo dnf upgrade -y >/dev/null

    # Util for using COPR
    sudo dnf install dnf-plugins-core -y >/dev/null

    echo -e "$ARROW Adding ${BLUE}keyd${RESET} repository..."
    sudo dnf copr enable alternateved/keyd -y >/dev/null

    echo -e "$ARROW Installing ${BLUE}desktop dependencies${RESET}..."
    sudo dnf install --setopt=install_weak_deps=False tuned swaylock keyd -y >/dev/null

    echo -e "$ARROW Enabling ${BLUE}services${RESET}..."
    systemctl --user enable --now pipewire.service >/dev/null
    systemctl --user enable --now pipewire-pulse.service >/dev/null
    sudo systemctl enable --now tuned >/dev/null
    sudo systemctl enable --now keyd >/dev/null
}

nix_trusted_users() {
    echo -e "$ARROW Configuring ${BLUE}Nix trusted users${RESET}..."
    sudo mkdir -p /etc/nix
    sudo tee /etc/nix/nix.custom.conf >/dev/null <<<"trusted-users = root @wheel $(whoami)"
}

keyd_config() {
    echo -e "$ARROW Copying ${BLUE}keyd${RESET} config..."
    sudo mkdir -p /etc/keyd >/dev/null
    sudo tee /etc/keyd/default.conf >/dev/null <<EOF
[ids]
*
[main]
a = overloadt(alt, a, 200)
s = overloadt(meta, s, 200)
d = overloadt(shift, d, 200)
f = overloadt(control, f, 200)
g = altgr
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
w+e = esc
i+o = backspace
z+x = tab
comma+dot = enter
space = overloadt(extend, space, 200)

[extend]
q = esc
w = tab
i = up
a = alt
s = meta
d = shift
f = control
g = altgr
h = backspace
j = left
k = down
l = right
; = enter
f1 = f1
f2 = f2
f3 = f3
f4 = f4
f5 = f5
f6 = f6
f7 = f7
f8 = f8
f9 = f9
f10 = f10
f11 = f11
f12 = f12
EOF
}

if [ "$DISTRO" = "nixos" ]; then
    echo -e "$ARROW Detected ${BLUE}NixOS${RESET}..."
    sudo_check
    clone_config

    # Switch to NixOS configuration
    sudo NIX_CONFIG="experimental-features = nix-command flakes" \
        nixos-rebuild switch --flake ~/dev/nix"${PROFILE}"

    set_wallpaper

elif [ "$DISTRO" = "fedora" ]; then
    echo -e "$ARROW Detected ${BLUE}Fedora${RESET}..."
    sudo_check
    fedora_settings
    keyd_config
    libinput_quirks
    fedora_pkgs
    install_nix
    nix_trusted_users
    clone_config

    echo -e "$ARROW Applying ${BLUE}home-manager${RESET} configuration..."
    nix run github:nix-community/home-manager/master -- switch -b backup --flake "${DIR}""${PROFILE}"

    echo -e "$ARROW Enabling ${BLUE}GPU driver${RESET} access..."
    sudo "$(which non-nixos-gpu-setup)" >/dev/null

    set_wallpaper

    iwd_backend
    localsend_firewall
else
    echo -e "${RED}Error:${RESET} Unsupported distro: $DISTRO"
    exit 1
fi

echo -e "$ARROW ${GREEN}Done!${RESET} Reboot to apply all changes."
