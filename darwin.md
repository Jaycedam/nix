# Nix-darwin instructions

> [!WARNING]
> This is work in progress. Instructions may contain errors.

> [!IMPORTANT]
> This guide assumes you will clone the config repository into `~/dev/nix`. Adjust paths if using a different location.

## Installation

1. Install Determinate Nix:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

2. Activate Nix:

```sh
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

3. Clone this repo into ~/dev/nix:

```sh
nix shell nixpkgs#git -c git clone https://github.com/jaycedam/nix.git ~/dev/nix
```

4. Install nix-darwin:

```sh
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake ~/dev/nix#darwin
```

> [!TIP]
> If the command fails due to existing `/etc` files, back them up first (e.g., `sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin`). Then rerun the switch command.

### After the initial run, you can just run:

```sh
sudo darwin-rebuild switch --flake ~/dev/nix#darwin
```