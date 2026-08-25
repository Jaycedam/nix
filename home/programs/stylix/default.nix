{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  theme = import (./themes + "/${config.userSettings.theme.name}.nix");
in {
  imports = [inputs.stylix.homeModules.stylix];

  options.userSettings.theme = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "rose-pine";
      description = "Name of the theme file in home/programs/stylix/themes";
    };

    opacity = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Opacity applied to applications, terminal, popups and desktop";
    };

    borderRadius = lib.mkOption {
      type = lib.types.int;
      default = 0;
      description = "Border radius in pixels applied to corners across modules";
    };
  };

  config.stylix = {
    enable = true;
    base16Scheme = theme.base16Scheme;
    polarity = theme.polarity;
    image = pkgs.fetchurl {inherit (theme.image) url hash;};

    targets = {
      qt.enable = true; # disabled on hm standalone
      nixvim.enable = !(theme ? nixvim); # use nixvim colorscheme when set
    };

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
        package = pkgs.geist-font;
        name = "Geist Sans";
      };

      monospace = {
        package = pkgs.geist-font;
        name = "Geist Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  # stylix themes can optionally define a nixvim colorscheme instead of base16
  config.programs.nixvim = lib.optionalAttrs (theme ? nixvim) theme.nixvim;
}
