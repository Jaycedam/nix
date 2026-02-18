{ config, theme, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      border = {
        radius = theme.borderRadius;
      };
    };
  };

  stylix.targets.fuzzel.fonts.override = {
    sizes = {
      popups = config.stylix.fonts.sizes.applications;
    };
  };
}
