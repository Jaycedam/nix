{ config, ... }:
{
  # stylix home-manager overrides
  stylix = {
    targets.waybar.font = "sansSerif"; # originally monospace

    targets.fuzzel.fonts.override = {
      sizes = {
        popups = config.stylix.fonts.sizes.applications;
      };
    };
  };
}
