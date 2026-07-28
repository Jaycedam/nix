{
  pkgs,
  theme,
  inputs,
  ...
}:
{
  imports = [
    inputs.stylix.homeModules.stylix
    ./themes/${theme.name}.nix
  ];

  stylix = {
    enable = true;
    # qt is not enabled on hm standalone
    targets.qt.enable = true;

    opacity = {
      applications = 0.95;
      terminal = 0.95;
      popups = 0.95;
      desktop = 0.95;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus";
      light = "Papirus";
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
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
