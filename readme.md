# Nix Setup

My personal Nix setup for NixOS. It uses flakes, home-manager, matugen (automatic wallpaper based themes). Features toggleable compositors on NixOS (niri and hyprland). Also supports standalone home-manager for non-NixOS systems, including ARM Linux, with automatic handling of platform-specific packages.

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Table of Contents

- [Setup](#setup)
- [Useful Commands](#useful-commands)
  - [Rebuild](#rebuild)
  - [Update](#update)
  - [Diff](#diff)
- [Additional Documentation](#additional-documentation)

## Setup

The install script expects NixOS or Asahi Linux minimal (may also work on Fedora minimal).

- First run:

```bash
curl -fsSL https://raw.githubusercontent.com/jaycem-dev/nix/master/install.sh | bash
```

For later runs you can run the rebuild command for NixOS, or Home Manager if using Asahi/Fedora.

> [!NOTE]
> Other distros may require additional setup. See [Non-NixOS Setup Guide](./docs/non-nixos-setup.md)

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

Then run the rebuild command for NixOS or Home Manager, depending on which config you are using.

### Diff

Useful for checking what changes will be made before switching configurations.

- NixOS:

```sh
sudo nixos-rebuild dry-activate --flake ~/dev/nix#nixos-niri
```

- Home Manager standalone:

```bash
home-manager switch -b backup --dry-run --flake ~/dev/nix#jay-niri-arm
```

## Additional Documentation

- [Non-NixOS Setup Guide](./docs/non-nixos-setup.md)
- [Config Overview](./docs/config-overview.md)
