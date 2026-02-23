# Nix Setup

My nix config for NixOS and Home Manager (NixOS module and standalone options). Check the profile options in the install section.

> [!IMPORTANT]
> Uses `~/dev/nix` path (install script default).

**Note:** This uses Colemak-DH-ISO keyboard layout by default.

Related files: [keyboard.nix](./modules/nixos/keyboard.nix), [niri.kdl](./modules/home/compositors/niri/niri.kdl), [mango.nix](./modules/home/compositors/mango/default.nix), [install.sh](./install.sh)

![Screenshot](assets/screenshot.avif)

## Install

The install script auto-detects the distro (only NixOS or Fedora currently) and applies the appropriate configuration. Pass a flake profile as the first argument.

- **NixOS**: Clones config, runs nixos-rebuild switch with the profile provided
- **Fedora**: Applies system settings, installs system pkgs with dnf (keyd, pipewire, etc.), installs Nix, applies [GPU fix](https://nix-community.github.io/home-manager/options.xhtml#opt-targets.genericLinux.enable), then runs home-manager switch with the profile provided

```bash
curl -fsSL jaycem.dev/nix | bash -- nixos-mango
```

**Available profiles (defined in [flake.nix](./flake.nix)):**

| NixOS (with HM as module) | Home Manager standalone |
| ------------------------- | ----------------------- |
| `nixos-niri`              | `niri`                  |
| `nixos-mango`             | `mango`                 |
|                           | `asahi-niri` (arm64)    |
|                           | `asahi-mango` (arm64)   |

## Software

- Compositor and tools: niri/mangowc, fuzzel, waybar, mako, swayidle, swaylock
- Main programs: kitty, fish, neovim
- Theming: stylix
