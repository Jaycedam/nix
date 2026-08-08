# Nix Config

My setup for NixOS and Home Manager standalone.

I use Colemak-DH-ISO keyboard layout by default, you can change this in [keyboard.nix](./nixos/services/default.nix) and [niri.kdl](./home/programs/niri/default.nix).

> [!IMPORTANT]
> New NixOS installs usually require copying `/etc/nixos/hardware-configuration.nix` to the host directory or you won't be able to boot.

## Install

Choose a `<host>` from one of the values below. (See my current configurations in [hosts](./hosts)

| Nixos                              | Home Manager      |
| ---------------------------------- | ----------------- |
| desktop                            | jay@desktop       |
| asahi (arm64, needs --impure flag) | jay@asahi (arm64) |

```bash
# Clone this repo using nix-shell:
nix-shell -p git neovim --command "git clone https://github.com/jaycem-dev/nix ~/Projects/nix && cd ~/Projects/nix; return"

# Modify config if necessary, then rebuild:
sudo nixos-rebuild switch --flake .#<host>

# Home Manager
nix run home-manager -- switch --flake .#<host>
```

The pkg [nh](https://github.com/nix-community/nh) is configured to use `~/Projects/nix-config` automatically, so after the initial rebuild you can use `nh os/home switch` from anywhere.

## Software

- Compositor and tools: Niri, Waybar, Fuzzel, Hypridle, Wpaperd, Swaylock
- Main programs: Neovim, Kitty, Yazi
- Theming: Stylix
