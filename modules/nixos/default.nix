{
  compositor,
  apple-silicon ? null,
  lib,
  desktop,
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
    ../common/stylix.nix
  ]
  ++ lib.optional desktop ./homelab.nix
  ++ lib.optionals (apple-silicon == null) [
    (
      if compositor == "niri" then
        ./niri.nix
      else if compositor == "mango" then
        ./mango.nix
      else if compositor == "hyprland" then
        ./hyprland.nix
      else
        throw "Unsupported compositor: ${compositor}"
    )
    ./gaming.nix
  ];
}
