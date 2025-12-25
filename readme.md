# Nix Setup

I only push working nix configurations but it's still a work in progress.

## Apply NixOS configuration

This will clone the repository to **~/dev/nix** and generate the system using flakes. It loads #nixos automatically, I will modify the installation when I add other hosts like nix-darwin.

```bash
nix-shell -p git --run "curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash"
```

## Updating NixOS configuration

By default, the nix repo will be cloned to ~/dev/nix

## Structure

This was designed with a single user in mind, allowing multiple hosts that load the common modules (system and home-manager) or the specific **darwin** or **nixos** modules.

## Tips

- Rebuild the system with `sudo nixos-rebuild switch --flake $HOME/dev/nix#nixos`
