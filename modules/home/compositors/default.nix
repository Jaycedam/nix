{ compositor, ... }:
{
  imports =
    if compositor == "niri" then
      [ ./niri ]
    else if compositor == "mango" then
      [ ./mango ]
    else if compositor == "hyprland" then
      [ ./hyprland ]
    else
      throw "Unsupported compositor: ${compositor}";
}
