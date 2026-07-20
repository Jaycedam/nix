{
  lib,
  desktop,
  ...
}:
{
  imports = [
    ./programs.nix
    ./browser.nix
    ./desktop-items.nix
    ./dev.nix
    ./gaming.nix
    ./overlays.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./keyboard.nix
    ./virtualization.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  environment.pathsToLink = [ "share/thumbnailers" ];
}
