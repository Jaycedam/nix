{
  compositor,
  apple-silicon ? null,
  lib,
  desktop,
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
    ../common/stylix.nix
  ]
  ++ lib.optional desktop ./homelab.nix
  ++ lib.optionals (apple-silicon == null) [
    (
      if compositor == "niri" then
        ./niri.nix
      else if compositor == "mango" then
        ./mango.nix
      else
        throw "Unsupported compositor: ${compositor}"
    )
    ./gaming.nix
  ];
}
