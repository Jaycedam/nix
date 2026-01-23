{ compositor, ... }:
{
  imports =
    {
      niri = [ ./niri.nix ];
      hyprland = [ ./hyprland.nix ];
    }
    .${compositor} or (throw "Invalid compositor: ${compositor}");
}
