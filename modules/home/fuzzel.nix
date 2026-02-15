{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      border = {
        radius = 10;
      };
    };
  };

  stylix.targets.fuzzel.fonts.override = {
    sizes = {
      popups = config.stylix.fonts.sizes.applications;
    };
  };
}
