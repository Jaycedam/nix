{
  lib,
  desktop,
  ...
}:
{
  imports = [
    ./programs.nix
    ../shared/overlays.nix
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
