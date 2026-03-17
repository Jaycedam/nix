# Nix Setup

My nix config for NixOS and Home Manager (NixOS module and standalone options).

**Note:** This uses Colemak-DH-ISO keyboard layout by default.

Related files: [keyboard.nix](./modules/nixos/keyboard.nix)

![Screenshot](assets/screenshot.avif)

## Install

This will use the hostname for the profile, or you can specify with `github:jaycem-dev/nix#hostname` (see profiles below).

> [!WARNING]
> This will overwrite your current configuration and may not be compatible with your current setup. Make sure you know what you are doing.

> [!NOTE]
> You need to add --impure flag if you are using an Asahi profile, because the flake references external firmware directory.

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake github:jaycem-dev/nix
```

**Available profiles (defined in [flake.nix](./flake.nix)):**

| NixOS (with HM as module) | Home Manager standalone |
| ------------------------- | ----------------------- |
| desktop                   | TODO                    |
| asahi (arm64)             |                         |

## Software

- Compositor and tools: mangowc, fuzzel, waybar, mako, swayidle, swaylock
- Main programs: kitty, fish, neovim
- Theming: stylix
