{ config, theme, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;

  colorTemplate = builtins.readFile ./colors.kdl.mustache;
  colorsRendered = builtins.replaceStrings
    [
      "{{base00}}" "{{base01}}" "{{base02}}" "{{base03}}"
      "{{base04}}" "{{base05}}" "{{base06}}" "{{base07}}"
      "{{base08}}" "{{base09}}" "{{base0A}}" "{{base0B}}"
      "{{base0C}}" "{{base0D}}" "{{base0E}}" "{{base0F}}"
      "{{wallpaper}}"
    ]
    [
      colors.base00  colors.base01  colors.base02  colors.base03
      colors.base04  colors.base05  colors.base06  colors.base07
      colors.base08  colors.base09  colors.base0A  colors.base0B
      colors.base0C  colors.base0D  colors.base0E  colors.base0F
      config.stylix.image
    ]
    colorTemplate;

  configTemplate = builtins.readFile ./config.kdl;
  configRendered = builtins.replaceStrings
    [ "{{border-radius}}" ]
    [ (toString theme.border-radius) ]
    configTemplate;
in {
  home.file = {
    ".config/niri/config.kdl".text = configRendered;
    ".config/niri/colors.kdl".text = colorsRendered;
  };
}
