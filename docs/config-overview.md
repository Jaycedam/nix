# Configuration Overview

The flow starts with the [flake.nix](../flake.nix) file, which defines both NixOS system configurations and standalone home-manager configurations. The profiles are where the system is constructed with system/home-manager default modules as well as a compositor.

## Unified Flake Architecture

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
