{
  compositor,
  apple-silicon ? null,
  lib,
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
    ./homelab.nix
    ../common/stylix.nix

    # Compositor
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
  ]
  ++ lib.optionals (apple-silicon == null) [
    ./gaming.nix
  ];
}
