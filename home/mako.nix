{
  config,
  lib,
  theme,
  ...
}:
{
  services.mako = {
    enable = true;
    settings = {
      width = 400;
      padding = 10;
      border-size = 2;
      inherit (theme) border-radius;
      layer = "overlay";
      # set opacity to 1 until ext-background-effect-v1 is added https://github.com/emersion/mako/issues/631
      background-color = lib.mkForce (config.lib.stylix.colors.withHashtag.base00 + "FF");

      "category=osd" = {
        anchor = "top-center";
        padding = 5;
        width = 200;
        height = 50;
        default-timeout = 1500;
      };
    };
  };
}
