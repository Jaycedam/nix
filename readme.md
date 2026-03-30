# Nix Setup

My nix config for NixOS and Home Manager (NixOS module and standalone options).

**Note:** This uses Colemak-DH-ISO keyboard layout by default.

Related files: [keyboard.nix](./modules/nixos/keyboard.nix)

![Screenshot](assets/screenshot.avif)

## Install

> [!WARNING]
> Do not use this flake if you don't know how to use NixOS. You will end up with a broken generation because of the hardware specific files.

> [!IMPORTANT]
> If you reinstall NixOS with encryption, you will need to copy the hardware-configuration.nix file from `/etc/nixos/hardware-configuration.nix` to the profile directory and update the UUIDs in `host/{profile}/default.nix` or you won't be able to boot.

> [!NOTE]
> You need to add --impure flag if you are using an Asahi profile, because the flake references external firmware directory.

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake github:jaycem-dev/nix#profile
```

**Replace `profile` with one of the profiles below.**

**Available profiles (defined in [flake.nix](./flake.nix)):**

| NixOS (with HM as module) | Home Manager standalone |
| ------------------------- | ----------------------- |
| desktop                   | TODO                    |
| asahi (arm64)             |                         |

## Software

- Compositor and tools: niri, fuzzel, waybar, mako, swayidle, swaylock
- Main programs: kitty, fish, neovim
- Theming: stylix
