# Nix Setup

My NixOS config.

**Note:** This uses Colemak-DH-ISO keyboard layout by default.

Related files: [keyboard.nix](./nixos/keyboard.nix)

![Screenshot](assets/screenshot.avif)

## Install

> [!WARNING]
> Do not use this flake if you don't know how to use NixOS. You will end up with a broken generation because of the hardware specific files.

> [!IMPORTANT]
> If you reinstall NixOS with encryption, you will need to copy the hardware-configuration.nix file from `/etc/nixos/hardware-configuration.nix` to the profile directory and update the UUIDs in `host/{profile}/default.nix` or you won't be able to boot.

> [!NOTE]
> You need to add --impure flag if you are using an Asahi profile, because the flake references external firmware directory.

1. NixOS Configuration:

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" \
    nixos-rebuild switch --flake github:jaycem-dev/nix#profile
```

**Replace `profile` with one of the profiles below.**

**Available profiles (defined in [flake.nix](./flake.nix)):**

- desktop
- asahi (arm64)

    2.Dotfiles managed with GNU Stow:\*\*

```bash
git clone https://github.com/jaycem-dev/dotfiles.git ~/dev/dotfiles --depth=1 && cd ~/dev/dotfiles && stow .
```

## Software

- Compositor and tools: Niri with Noctalia Shell
- Main programs: Foot, Neovim, Yazi
