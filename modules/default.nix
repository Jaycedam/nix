{
  lib,
  desktop,
  system,
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
    ./chromium.nix
    ./keyboard.nix
    ./greeter.nix
    ./virtualization.nix
    ./compositor.nix
  ]
  ++ lib.optional (system == "x86_64-linux") ./gaming.nix
  ++ lib.optional desktop ./homelab.nix;

  fonts.fontconfig.enable = true;
}
