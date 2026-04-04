{
  lib,
  desktop,
  system,
  ...
}:
{
  # Required for home-manager with useUserPackages enabled (for xdg-portal integration)
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

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
    ./stylix.nix
    ./mango.nix
  ]
  ++ lib.optional desktop ./homelab.nix
  # don't enable gaming on arm, it requires 32bit support
  ++ lib.optionals (system == "x86_64-linux") [
    ./gaming.nix
  ];

  programs.fish.enable = true;
}
