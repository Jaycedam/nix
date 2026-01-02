# Nix Setup

My personal Nix setup for NixOS and Nix Darwin.
It uses flakes, home-manager, stylix (automatic global base16 themes) and nix-homebrew for missing darwin packages.

On NixOS, the default keyboard layout is set to colemak-dh, using keyd for keyboard layers like home-row mods.
Same for macOS, except it uses kanata instead of keyd, it also needs manual intervention due to macOS limitations.

## Main programs

- Shared: fish shell, kitty, neovim, tmux
- NixOS: hyprland/niri, waybar, rofi, keyd
- Darwin: aerospace(wm), kanata

## Apply NixOS configuration

This will clone the repository to **~/dev/nix** and generate the system using flakes. It loads #nixos-niri automatically, I will modify the installation when I add other hosts like nix-darwin.

```bash
nix-shell -p git --run "curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash"
```

## Nix Darwin

WIP.
A draft is available in [here](./darwin.md).
It will be moved to the main script when it's finished.

## Commands

> [!NOTE]
> Nix darwin commands use the same syntax as nixos commands, just replace nixos with darwin. eg: **nixos-rebuild** to **darwin-rebuild**.

### Update

```sh
nix flake update
```

Then run the rebuild command.

### Rebuild

Use the correct #host, options: #nixos-hyprland, #nixos-niri, #darwin.

Check the [flake.nix](./flake.nix) file for available hosts.

```sh
sudo nixos-rebuild switch --flake $HOME/dev/nix#nixos-niri
```
