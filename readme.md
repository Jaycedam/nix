# Nix Setup

My personal Nix flake for NixOS with standalone Home Manager for non-NixOS systems.

**Note:** This uses Colemak-DH-ISO keyboard layout by default. Edit [keyboard.nix](./modules/nixos/keyboard.nix) and [niri.kdl](./modules/home/niri/niri.kdl) before installing.

> [!IMPORTANT]
> Uses `~/dev/nix` path (install script default).

## Table of Contents

- [Description](#description)
- [Install](#install)
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

## Install

Current install script works on both NixOS and Fedora with standalone Home Manager.

**NixOS**: Clones repo to `~/dev/nix`, then applies NixOS configuration.

**Fedora**: Clones repo, applies system settings, installs system dependencies, installs Nix, and applies Home Manager configuration.

```bash
curl -fsSL jaycem.dev/nix | bash
```

## Project Structure

This flake provides a unified configuration system that works on both NixOS and non-NixOS systems.

- **NixOS**: Full system rebuild with integrated home-manager
- **Standalone**: Home Manager for any Linux distribution (including NixOS)

| Directory             | Description                                                                  |
| --------------------- | ---------------------------------------------------------------------------- |
| **profiles/**         | System entry points - defines complete NixOS and Home Manager configurations |
| modules/nixos/        | NixOS system-level modules (boot, network, services, users, etc.)            |
| modules/home/         | Home Manager user-level modules (programs, dotfiles, window managers, etc.)  |
| modules/home/scripts/ | Standalone utility scripts packaged as derivations                           |
| modules/common/       | Shared modules used by both NixOS and Home Manager (stylix, etc.)            |
| modules/hosts/        | Host-specific hardware and system config (hardware-config.nix, mounts, etc.) |

## Useful Commands

### Rebuild

- NixOS:

Available profiles: `#nixos`

Leave empty if current hostname match the available profiles.

```
sudo nixos-rebuild switch --flake ~/dev/nix#nixos
```

- Home Manager Standalone:

Available profiles: `#jay`, `#asahi` (aarch64-linux).

Add # at the end of the command to use a specific profile, eg. `.../nix#jay`.

Leave empty if current user match the available profiles.

```bash
home-manager switch -b backup --flake ~/dev/nix
```

### Update

```sh
nix flake update
```

Then run the rebuild command for NixOS or Home Manager.
