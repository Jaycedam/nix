{ config, theme, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      border = {
        radius = theme.border-radius;
      };
    };
  };

  stylix.targets.fuzzel.fonts.override = {
    sizes = {
      popups = config.stylix.fonts.sizes.applications;
    };
  };
}
