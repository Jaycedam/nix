{ theme, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      outer-margin = 10;
      width = 400;
      padding = 10;
      border-size = 2;
      inherit (theme) border-radius;
      layer = "overlay";

      "category=osd" = {
        anchor = "top-center";
        padding = 5;
        width = 200;
        height = 30;
        default-timeout = 1500;
      };
    };
  };
}
