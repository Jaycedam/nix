# Nix Setup

My personal Nix setup for NixOS and Nix Darwin. It uses flakes, home-manager, stylix (automatic global base16 themes), and nix-homebrew for missing darwin packages. Features toggleable compositors on NixOS (niri and hyprland) and aerospace WM on Darwin.

On NixOS, the keyboard layout defaults to Colemak-DH with keyd handling home-row mods. On macOS, both Colemak-DH and Kanata require manual setup due to system limitations.

## Apply NixOS configuration

Clone the repo to ~/dev/nix and apply with flakes. Loads nixos-niri by default.

```bash
nix shell nixpkgs#git nixpkgs#curl -c curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

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
