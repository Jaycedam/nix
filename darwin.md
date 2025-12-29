# Nix-darwin instructions

> [!WARNING]
> Work in progress, the instructions may contain errors.

## Installation

1. Install Nix package manager:

```sh
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

2. Clone this repo into ~/dev/nix:

```sh
nix-shell -p git —run "git clone https://github.com/jaycedam/nix.git ~/dev/nix"
```

3. Backep /etc files:

```sh
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
```

4. Use nix-darwin:

### For first time setup you need to use nix run to add nix-darwin to the path:

```sh
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake ~/dev/nix#darwin
```

### After you can just run:

```sh
sudo darwin-rebuild switch --flake ~/dev/nix/darwin#darwin
```
