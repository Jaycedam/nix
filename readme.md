# Nix Setup

My personal Nix flake for NixOS with standalone Home Manager for non-NixOS systems.

**Note:** This uses Colemak-DH-ISO keyboard layout by default. Edit [keyboard.nix](./modules/nixos/keyboard.nix) and [niri.kdl](./modules/home/niri/niri.kdl) before installing.

> [!IMPORTANT]
> Uses `~/dev/nix` path (install script default).

## Table of Contents

- [Description](#description)
- [Install](#install)
- [Nix Cli Helper](#nix-cli-helper)
- [Project Structure](#project-structure)

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

## Nix Cli Helper

The [`ns`](./modules/home/scripts/system/nix-utils.nix) cli is included as a pkg derivation and provides an unified and easier interface for managing NixOS and Home Manager flake based configurations with the same cli.

```bash
ns <action> [target] [options]
```

When no target is specified, both NixOS and Home Manager are applied. The `update` action also rebuilds after updating the flake.

Available actions: `update`, `switch`, `clean`, `news`

Available targets: `home`, `nixos`

Available options: `-c, --config <dir>`, `--user <name>` (home-manager profile), `--host <name>` (nixos profile), `--gc` (garbage collection)

Run `ns -h` for more information.

### Examples

```bash
ns switch                       # Rebuild both NixOS and Home Manager
ns switch home                  # Rebuild Home Manager only
ns switch nixos --host laptop   # Rebuild NixOS with laptop profile
ns switch home --user jay       # Rebuild Home Manager with jay profile
ns update --gc                  # Update and run garbage collection
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
