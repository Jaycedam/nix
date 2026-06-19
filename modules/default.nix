{ lib, desktop, ... }:
{
  imports = [
    ./editor.nix
    ./dev.nix
    ./programs.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./chromium.nix
    ./keyboard.nix
    ./greeter.nix
    ./virtualization.nix
    ./compositor.nix
    ./gaming.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  programs.fish.enable = true;
  fonts.fontconfig.enable = true;
}
