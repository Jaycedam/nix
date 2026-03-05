{ compositor, ... }:
{
  imports =
    if compositor == "niri" then
      [ ./niri.nix ]
    else if compositor == "mango" then
      [ ./mango.nix ]
    else
      throw "Unsupported compositor: ${compositor}";
}
