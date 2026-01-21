# Nix Setup

My personal Nix setup for NixOS. It uses flakes, home-manager, matugen (automatic wallpaper based themes). Features toggleable compositors on NixOS (niri and hyprland). Also supports standalone home-manager for non-NixOS systems, including ARM Linux, with automatic handling of platform-specific packages.

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Table of Contents

- [Clone Repository](#clone-repository)
- [Apply Configuration](#apply-configuration)
  - [NixOS](#nixos)
  - [Home Manager Standalone](#home-manager-standalone)
- [Useful Commands](#useful-commands)
  - [Update](#update)
  - [Diff](#diff)
- [Additional Documentation](#additional-documentation)

## Clone Repository

```bash
nix-shell -p git --run "git clone https://github.com/jaycedam/nix.git ~/dev/nix"
```

## Apply Configuration

### NixOS

Available configurations: `#nixos-niri`, `#nixos-hyprland`

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake ~/dev/nix#nixos-niri
```

### Home Manager Standalone

> [!IMPORTANT]
> Non-NixOS systems require additional setup. See the [Non-NixOS Setup Guide](./docs/non-nixos-setup.md) for required kernel module and user group configuration.

This flake supports standalone home-manager configurations for non-NixOS systems. The same configuration modules are used, ensuring consistent dotfiles across all systems.

Available configurations: `#jay-niri-arm`, `#jay-hyprland-arm`

```bash
home-manager switch --flake ~/dev/nix#jay-niri-arm
```

Or using the GitHub runner (recommended for ARM systems):

```bash
nix run github:nix-community/home-manager/master -- switch --flake ~/dev/nix#jay-niri-arm
```

**Note:** Use `-b backup` to automatically backup conflicting files (recommended).

## Useful Commands

### Update

```sh
nix flake update
```

Then run the rebuild command for NixOS or Home Manager, depending on which config you are using.

### Diff

Useful for checking what changes will be made before switching configurations.

**NixOS:**

```sh
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos-niri
```

**Home Manager standalone:**

```bash
home-manager switch --dry-run --flake ~/dev/nix#jay-niri-arm
```

**Note:** Use `-b backup` when switching to automatically backup conflicting files.

## Additional Documentation

- [Non-NixOS Setup Guide](./docs/non-nixos-setup.md)
- [Config Overview](./docs/config-overview.md)
