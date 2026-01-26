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

## Apply Configuration

### NixOS

**First run:**

```bash
curl -fsSL https://raw.githubusercontent.com/jaycem-dev/nix/master/scripts/nixos.sh | bash
```

**Subsequent runs:**

```bash
sudo nixos-rebuild switch --flake ~/dev/nix#nixos-niri
```

### Asahi Linux

> [!NOTE]
> Other distros may require additional setup. See the [Non-NixOS Setup Guide](./docs/non-nixos-setup.md) for required kernel module and user group configuration.

This script expects Asahi Linux minimal (may also work on Fedora minimal). It sets up everything automatically using the system's package manager for the Wayland compositor, login manager, and PipeWire with PulseAudio compatibility. The remaining apps and all user configuration are handled by home-manager standalone.

**First run:**

```bash
curl -fsSL https://raw.githubusercontent.com/jaycem-dev/nix/master/scripts/asahi.sh | bash
```

**Subsequent runs:**

```bash
home-manager switch -b backup --flake ~/dev/nix#jay-niri-arm
```

## Useful Commands

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
