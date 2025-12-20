# Nix Setup

Work in progress.

## Apply NixOS configuration

> [!WARNING]
> This will overwrite your current configuration. Make sure you have a backup.

This will clone the repository, symlink the configuration.nix file from this repo to /etc/nixos and then rebuild the system.

```bash
curl -fsSL https://raw.githubusercontent.com/jaycedam/nix/master/install.sh | bash
```

## Updating NixOS configuration

By default, the nix repo will be cloned to ~/dev/nix. You can modify the files directly in the repo for version control.

## Tips

- Rebuild the system with `sudo nixos-rebuild switch`.
