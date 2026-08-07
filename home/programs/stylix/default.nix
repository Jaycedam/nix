{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  theme = import (./themes + "/${config.userSettings.theme.name}.nix");
in {
  options.userSettings.theme = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "gruvbox-material-dark-hard";
      description = "Name of the theme file in home/programs/stylix/themes";
    };
    opacity = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Opacity applied to applications, terminal, popups and desktop";
    };
  };

  imports = [
    inputs.stylix.homeModules.stylix
  ];

  config.stylix = {
    enable = true;
    # qt is not enabled on hm standalone
    targets.qt.enable = true;

    base16Scheme = theme.base16Scheme;
    polarity = theme.polarity;
    image = pkgs.fetchurl {inherit (theme.image) url hash;};

    opacity = {
      applications = config.userSettings.theme.opacity;
      terminal = config.userSettings.theme.opacity;
      popups = config.userSettings.theme.opacity;
      desktop = config.userSettings.theme.opacity;
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
