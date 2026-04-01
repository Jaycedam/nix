{
  inputs,
  theme,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../themes/${theme.name}.nix
  ];

  # global stylix settings
  # the rest is set per theme
  stylix = {
    enable = true;
    polarity = "dark";

    opacity = {
      applications = 0.9;
      terminal = 0.9;
      popups = 0.9;
      desktop = 0.9;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      size = 24;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
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
