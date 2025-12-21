# Nix Setup

Work in progress.

## Apply NixOS configuration

This will clone the repository and generate the system using flakes, it will use the hostname by default to see which modules to load.

```bash
curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

## Updating NixOS configuration

By default, the nix repo will be cloned to ~/dev/nix. You can modify the files directly in the repo for version control.

## Tips

- Rebuild the system on ~/dev/nix with `sudo nixos-rebuild switch --flake .`.
