{
  lib,
  desktop,
  ...
}:
{
  imports = [
    ./programs.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    # ./browser.nix
    ./keyboard.nix
    ./greeter.nix
    ./stylix.nix
    ./virtualization.nix
    ./gaming.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  environment.pathsToLink = [ "share/thumbnailers" ];
}
