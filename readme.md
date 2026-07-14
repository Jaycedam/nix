# Nix Setup

NixOS flake config with Home Manager.

I use Colemak-DH-ISO keyboard layout by default, modify in [keyboard.nix](./modules/keyboard.nix)

## Install

> [!WARNING]
> Do not use this flake if you don't know how to use NixOS. You will end up with a broken generation because of the hardware specific files.

> [!IMPORTANT]
> If you reinstall NixOS with encryption, you will need to copy the hardware-configuration.nix file from `/etc/nixos/hardware-configuration.nix` to the profile directory and update the UUIDs in `host/{profile}/default.nix` or you won't be able to boot.

### NixOS Configuration:

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake github:jaycem-dev/nix#profile
```

**Replace `profile` with one of the profiles below (defined in [flake.nix](./flake.nix)):**

- desktop
- asahi (ARM64, needs --impure flag)

## Software

- Compositor and tools: Niri, Waybar, Fuzzel, Hypridle, Swaybg, Swaylock
- Main programs: Kitty, Neovim, Yazi
- Theming: stylix
