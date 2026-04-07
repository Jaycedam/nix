{
  lib,
  desktop,
  system,
  ...
}:
{
  imports = [
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
    ./scripts
  ]
  ++ lib.optional desktop ./homelab.nix
  # don't enable gaming on arm, it requires 32bit support
  ++ lib.optionals (system == "x86_64-linux") [
    ./gaming.nix
  ];

  programs.fish.enable = true;
  fonts.fontconfig.enable = true;
}
