# Nix Setup

My personal Nix flake dual setup for NixOS and Asahi/Fedora with standalone home-manager.

If you intend to use this configuration, you may want to clone the project first, then change the keyboard layout in [install.sh](./install.sh) and [niri.kdl](./home/compositor/niri/niri.kdl), since I use Colemak-DH-ISO by default. You may also want to disable the keyd service in the [install script](./install.sh).

> [!IMPORTANT]
> This guide uses `~/dev/nix` because that is the default path that the install script uses.

## Table of Contents

- [Setup](#setup)
- [Useful Commands](#useful-commands)
  - [Rebuild](#rebuild)
  - [Update](#update)
  - [Diff](#diff)
- [Project Structure](#project-structure)

## Setup

### First Run

```bash
curl -fsSL https://raw.githubusercontent.com/jaycem-dev/nix/master/install.sh | bash
```

For later runs, run the rebuild command for NixOS or Home Manager if using Asahi/Fedora.

## Useful Commands

### Rebuild

- NixOS:

```
sudo nixos-rebuild switch --flake ~/dev/nix#nixos-niri
```

- Asahi/Fedora:

```bash
home-manager switch -b backup --flake ~/dev/nix#jay-niri-arm
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
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos-niri
```

- Asahi/Fedora:

```bash
home-manager switch -b backup --dry-run --flake ~/dev/nix#jay-niri-arm
```

## Project Structure

This flake provides a unified configuration system that works on both NixOS and non-NixOS systems.

- **NixOS**: Full system rebuild with integrated home-manager
- **Standalone**: Home-manager only for any Linux distribution

| Directory            | Description                                                                  |
| -------------------- | ---------------------------------------------------------------------------- |
| home/                | Home-manager modules for user-level customization                            |
| home/scripts/        | Standalone utility scripts packaged as derivations                           |
| home/compositors/    | Home-manager compositor modules (niri, hyprland)                             |
| hosts/               | Physical device configurations for NixOS (hardware config, mounts, monitors) |
| modules/             | NixOS-specific system modules                                                |
| modules/compositors/ | Compositor-specific NixOS modules (niri, hyprland)                          |
| profiles/            | Platform entry points composing main modules for a specific OS               |
| wall/                | Wallpapers                                                                   |
