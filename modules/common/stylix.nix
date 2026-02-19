{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    # fonts.sizes = {
    #   # applications = 12; # default: 12
    #   # terminal = 12; # default: applications
    #   # desktop = 8; # default: 10
    #   # popups = 10; # default: desktop
    # };

    # opacity = {
    #   applications = 0.95;
    #   terminal = 0.95;
    #   popups = 0.95;
    #   desktop = 0.95;
    # };

    icons = {
      enable = true;
      package = pkgs.candy-icons;
      dark = "candy-icons";
      light = "candy-icons";
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
