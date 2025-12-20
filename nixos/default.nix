{
  lib,
  desktop,
  ...
}:
{
  imports = [
    ./programs.nix
    ./overlays.nix
    ./options.nix
    ./users.nix
    ./boot.nix
    ./network.nix
    ./services.nix
    ./keyboard.nix
    ./stylix.nix
    ./virtualization.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  environment.pathsToLink = [ "share/thumbnailers" ];
}
