# Nix Setup

My personal Nix setup for NixOS. It uses flakes, home-manager, matugen (automatic wallpaper based themes). Features toggleable compositors on NixOS (niri and hyprland).

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Table of Contents

- [Apply NixOS configuration](#apply-nixos-configuration)
- [Standalone Home Manager](#standalone-home-manager)
- [Useful Commands](#useful-commands)
  - [Update](#update)
  - [Rebuild](#rebuild)
  - [Diff before switch](#diff-before-switch)
  - [Home Manager Standalone](#home-manager-standalone)
- [Config Overview](#config-overview)

## Apply NixOS configuration

Clone the repo to ~/dev/nix and apply with flakes. Loads nixos-niri by default.

```bash
nix shell nixpkgs#git nixpkgs#curl -c curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

## Standalone Home Manager

This flake also supports standalone home-manager configurations for non-NixOS systems. The same configuration modules are used, ensuring consistent dotfiles across all systems.

### Setup on non-NixOS

First, ensure home-manager is installed on your system, then run:

```bash
# For niri compositor
home-manager switch --flake ~/dev/nix#jay-niri

# For hyprland compositor  
home-manager switch --flake ~/dev/nix#jay-hyprland
```

### Available Configurations

- `jay-niri`: Home config with niri compositor setup
- `jay-hyprland`: Home config with hyprland compositor setup

Both configurations automatically detect the system architecture and use the same home modules as the NixOS setup.

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

### Home Manager Standalone

For non-NixOS systems, update and rebuild home configurations:

```bash
# Update flake inputs
nix flake update ~/dev/nix

# Switch to niri configuration
home-manager switch --flake ~/dev/nix#jay-niri

# Switch to hyprland configuration  
home-manager switch --flake ~/dev/nix#jay-hyprland

# Dry run to check changes
home-manager build --flake ~/dev/nix#jay-niri
```

## Config Overview

The flow starts with the [flake.nix](./flake.nix) file, which defines both NixOS system configurations and standalone home-manager configurations. The profiles are where the system is constructed with system/home-manager default modules as well as a compositor.

### Unified Flake Architecture

This flake provides a unified configuration system that works on both NixOS and non-NixOS systems:

- **NixOS**: Full system rebuild with integrated home-manager
- **Standalone**: Home-manager only for any Linux distribution
- **Shared modules**: Both approaches use the same home/ modules for consistency

| Directory            | Description                                                                  |
| -------------------- | ---------------------------------------------------------------------------- |
| home/                | Home-manager modules for user-level customization                            |
| hosts/               | Physical device configurations for nixos (hardware config, mounts, monitors) |
| modules/             | NixOS specific system modules                                                |
| modules/compositors/ | Compositor specific nixos modules (niri, hyprland)                           |
| profiles/            | Platform entry points composing main modules for a specific OS               |
| scripts/             | Standalone utility scripts packaged as derivations                           |
| wall/                | Wallpapers                                                                   |
