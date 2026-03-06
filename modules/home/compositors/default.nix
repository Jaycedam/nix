{ compositor, ... }:
{
  imports =
    if compositor == "niri" then [ ./niri.nix ] else throw "Unsupported compositor: ${compositor}";
}
