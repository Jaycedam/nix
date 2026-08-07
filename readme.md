# Nix Setup

NixOS flake config with Home Manager standalone.

I use Colemak-DH-ISO keyboard layout by default, modify in [keyboard.nix](./nixos/keyboard.nix) and [niri.kdl](./home/niri/config.kdl)

## Install

> [!WARNING]
> Do not use this flake if you don't know how to use NixOS. You will end up with a broken generation because of the hardware specific files.

> [!IMPORTANT]
> NixOS installs usually require copying `/etc/nixos/hardware-configuration.nix` to the profile directory or you won't be able to boot. You should also check that the per host filesystem.nix works on your machine.

### NixOS Configuration:

```bash
# Clone this repo using nix-shell:
nix-shell -p git neovim --command "git clone https://github.com/jaycem-dev/nix ~/Projects/nix && cd ~/Projects/nix; return"

# Update config if necessary then rebuild:
sudo nixos-rebuild switch --flake .#profile
```

### Home Manager:

```bash
# First install (home-manager not yet installed):
nix run home-manager -- switch --flake .#profile

# Subsequent updates:
home-manager switch --flake .#profile
```

**Replace `#profile` with one of the profiles below (defined in [flake.nix](./flake.nix)). Profile names are shared between NixOS and Home Manager:**

- #desktop
- #asahi (ARM64, --impure flag only needed for nixos-rebuild)

## Software

- Compositor and tools: Niri, Waybar, Fuzzel, Hypridle, Wpaperd, Swaylock
- Main programs: Kitty, Neovim, Yazi
- Theming: Stylix
