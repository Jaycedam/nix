{ compositor, ... }:
{
  imports =
    if compositor == "niri" then
      [ ./niri ]
    else if compositor == "mango" then
      [ ./mango ]
    else
      throw "Unsupported compositor: ${compositor}";
}
