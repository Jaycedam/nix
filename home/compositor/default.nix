{
  compositor,
  ...
}:
{
  imports =
    {
      niri = [ ./niri/default.nix ];
      hyprland = [ ./hyprland.nix ];
    }
    .${compositor} or (throw "Invalid compositor: ${compositor}");
}
