# Nix Setup

My personal Nix flake dual setup for NixOS and Asahi/Fedora with standalone home-manager.

**Note:** This uses Colemak-DH-ISO keyboard layout by default. Edit [keyboard.nix](./modules/nixos/keyboard.nix) and [niri.kdl](./modules/home/niri/niri.kdl) before installing.

> [!IMPORTANT]
> Uses `~/dev/nix` path (install script default).

## Table of Contents

- [Description](#description)
- [Setup](#setup)
- [Project Structure](#project-structure)
- [Useful Commands](#useful-commands)
  - [Rebuild](#rebuild)
  - [Update](#update)
  - [Diff](#diff)

## Description

- Compositor and tools: Niri, Fuzzel, Waybar, Mako, Hyprlock, Hypridle
- Main programs: Kitty, Fish, Neovim
- Theming: stylix

![Screenshot](assets/screenshot.avif)

## Setup

### First Run

```bash
curl -fsSL https://raw.githubusercontent.com/jaycem-dev/nix/master/install.sh | bash
```

For later runs, run the rebuild command for NixOS or Home Manager if using Asahi/Fedora.

## Project Structure

This flake provides a unified configuration system that works on both NixOS and non-NixOS systems.

- **NixOS**: Full system rebuild with integrated home-manager
- **Standalone**: Home-manager only for any Linux distribution

| Directory             | Description                                                                  |
| --------------------- | ---------------------------------------------------------------------------- |
| **profiles/**         | System entry points - defines complete NixOS and Home Manager configurations |
| modules/nixos/        | NixOS system-level modules (boot, network, services, users, etc.)            |
| modules/home/         | Home Manager user-level modules (programs, dotfiles, window managers, etc.)  |
| modules/home/scripts/ | Standalone utility scripts packaged as derivations                           |
| modules/hosts/        | Host-specific hardware and system config (hardware-config.nix, mounts, etc.) |

## Useful Commands

### Rebuild

- NixOS:

```
sudo nixos-rebuild switch --flake ~/dev/nix#nixos
```

- Asahi/Fedora:

```bash
home-manager switch -b backup --flake ~/dev/nix#asahi
```

### Update

```sh
nix flake update
```

Then run the rebuild command for NixOS or Home Manager, depending on which configuration you are using.

### Diff

Useful for checking what changes will be made before switching configurations.

- NixOS:

```sh
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos
```

- Asahi/Fedora:

```bash
home-manager switch -b backup --dry-run --flake ~/dev/nix#asahi
```
