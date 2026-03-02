{ compositor, ... }:
{
  imports =
    if compositor == "niri" then
      [ ./niri.nix ]
    else if compositor == "mango" then
      [ ./mango.nix ]
    else if compositor == "hyprland" then
      [ ./hyprland.nix ]
    else
      throw "Unsupported compositor: ${compositor}";
}
