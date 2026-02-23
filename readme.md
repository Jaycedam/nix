# Nix Setup

My personal Nix flake for NixOS with standalone Home Manager for non-NixOS systems.

**Note:** This uses Colemak-DH-ISO keyboard layout by default. Edit [keyboard.nix](./modules/nixos/keyboard.nix) and [niri.kdl](./modules/home/niri/niri.kdl) before installing.

> [!IMPORTANT]
> Uses `~/dev/nix` path (install script default).

## Table of Contents

- [Description](#description)
- [Install](#install)

## Description

Home Manager is setup as a NixOS module, with available profiles for non-NixOS systems as well. Check the [flake.nix](./flake.nix) file for available profiles.

- Compositor and tools: niri/mangowc, fuzzel, waybar, mako, swayidle, swaylock
- Main programs: kitty, fish, neovim
- Theming: stylix

![Screenshot](assets/screenshot.avif)

## Install

The install script auto-detects the distro (NixOS or other) and applies the appropriate configuration. Pass a flake profile as the first argument.

```bash
curl -fsSL jaycem.dev/nix | bash -- nixos-mango
```

**Available profiles:**

| NixOS (with HM as module) | Home Manager standalone |
| ------------------------- | ----------------------- |
| `nixos-niri`              | `niri`                  |
| `nixos-mango`             | `mango`                 |
|                           | `asahi-niri` (arm64)    |
|                           | `asahi-mango` (arm64)   |
