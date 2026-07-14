{
  lib,
  desktop,
  ...
}:
{
  imports = [
    ./dev.nix
    ./programs.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./browser.nix
    ./desktop-items.nix
    ./keyboard.nix
    ./greeter.nix
    ./stylix.nix
    ./virtualization.nix
    ./gaming.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  fonts.fontconfig.enable = true;
  environment.pathsToLink = [ "share/thumbnailers" ];
}
