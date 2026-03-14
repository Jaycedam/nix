{ theme, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      outer-margin = 15;
      width = 400;
      padding = 10;
      border-size = 1;
      inherit (theme) border-radius;
      layer = "overlay";

      # OSD bottom-center
      "category=osd" = {
        anchor = "top-center";
        padding = 5;
        width = 200;
        height = 30;
        default-timeout = 1500;
        # outer-margin = 30;
      };
    };
  };
}
