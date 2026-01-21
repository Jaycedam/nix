# Nix Setup

My personal Nix setup for NixOS. It uses flakes, home-manager, matugen (automatic wallpaper based themes). Features toggleable compositors on NixOS (niri and hyprland).

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Table of Contents

- [Apply NixOS configuration](#apply-nixos-configuration)
- [Useful Commands](#useful-commands)
  - [Update](#update)
  - [Rebuild](#rebuild)
  - [Diff before switch](#diff-before-switch)
- [Config Overview](#config-overview)

## Apply NixOS configuration

Clone the repo to ~/dev/nix and apply with flakes. Loads nixos-niri by default.

```bash
nix shell nixpkgs#git nixpkgs#curl -c curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

## Useful Commands

### Update

```sh
nix flake update
```

Then run the rebuild command.

### Rebuild

Use the correct `#host`, options: `#nixos-hyprland`, `#nixos-niri`

Check the [flake.nix](./flake.nix) file for available hosts.

```sh
sudo nixos-rebuild switch --flake ~/dev/nix#nixos-niri
```

### Diff before switch

```sh
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos-niri
```

## Config Overview

The flow starts with the [flake.nix](./flake.nix) file, which defines the configuration per [profile](./profiles/). The profiles are where the system is constructed with system/home-manager default modules as well as a compositor.

| Directory            | Description                                                                  |
| -------------------- | ---------------------------------------------------------------------------- |
| home/                | Home-manager modules for user-level customization                            |
| hosts/               | Physical device configurations for nixos (hardware config, mounts, monitors) |
| modules/             | NixOS specific system modules                                                |
| modules/compositors/ | Compositor specific nixos modules (niri, hyprland)                           |
| profiles/            | Platform entry points composing main modules for a specific OS               |
| scripts/             | Standalone utility scripts packaged as derivations                           |
| wall/                | Wallpapers                                                                   |
