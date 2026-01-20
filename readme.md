# Nix Setup

My personal Nix setup for NixOS and Nix Darwin. It uses flakes, home-manager, matugen (automatic wallpaper based themes), and nix-homebrew for missing darwin packages. Features toggleable compositors on NixOS (niri and hyprland) and aerospace WM on Darwin.

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods. On macOS, both Colemak-DH and Kanata require manual setup due to system limitations.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Table of Contents

- [Apply NixOS configuration](#apply-nixos-configuration)
- [Useful Commands](#useful-commands)
  - [Update](#update)
  - [Rebuild](#rebuild)
  - [Diff before switch](#diff-before-switch)
- [Config Overview](#config-overview)
- [Nix-darwin instructions](#nix-darwin-instructions)

## Apply NixOS configuration

Clone the repo to ~/dev/nix and apply with flakes. Loads nixos-niri by default.

```bash
nix shell nixpkgs#git nixpkgs#curl -c curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

## Useful Commands

> [!NOTE]
> Nix darwin commands use the same syntax as nixos commands, just replace nixos with darwin. eg: **nixos-rebuild** to **darwin-rebuild**.

### Update

```sh
nix flake update
```

Then run the rebuild command.

### Rebuild

Use the correct `#host`, options: `#nixos-hyprland`, `#nixos-niri`, `#darwin`.

Check the [flake.nix](./flake.nix) file for available hosts.

```sh
sudo nixos-rebuild switch --flake ~/dev/nix#nixos-niri
```

### Diff before switch

```sh
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos-niri
```

## Config Overview

The flow starts with the [flake.nix](./flake.nix) file, which defines the configuration per [profile](./profiles/). The profiles are where the system is constructed with shared system/home-manager default modules and appropiate OS modules, as well as a compositor in the case of NixOS.

| Directory                  | Description                                                                  |
| -------------------------- | ---------------------------------------------------------------------------- |
| home/                      | Home-manager modules for user-level customization                            |
| hosts/                     | Physical device configurations for nixos (hardware config, mounts, monitors) |
| modules/darwin/            | Darwin specific system modules                                               |
| modules/nixos/             | NixOS specific system modules                                                |
| modules/nixos/compositors/ | Compositor specific nixos modules (niri, hyprland)                           |
| modules/shared/            | Cross-platform system modules for both nixos and darwin                      |
| profiles/                  | Platform entry points composing main modules for a specific OS               |
| scripts/                   | Standalone utility scripts packaged as derivations                           |
| wall/                      | Wallpapers                                                                   |

## Nix-darwin instructions

> [!WARNING]
> This is work in progress. Instructions may contain errors.

This will be moved to the installation script in the future.

1. Install Determinate Nix:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

2. Activate Nix:

```sh
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

3. Clone this repo into ~/dev/nix:

```sh
nix shell nixpkgs#git -c git clone https://github.com/jaycedam/nix.git ~/dev/nix
```

4. Install nix-darwin:

```sh
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake ~/dev/nix#darwin
```

> [!TIP]
> If the command fails due to existing `/etc` files, back them up first (e.g., `sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin`). Then rerun the switch command.
