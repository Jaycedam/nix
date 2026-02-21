{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    base16Scheme = {
      base00 = "#0f0f0f"; # default background
      base01 = "#141414"; # lighter background (status bar)
      base02 = "#212121"; # selection background
      base03 = "#595959"; # comments, invisibles
      base04 = "#737373"; # dark foreground (status bar)
      base05 = "#fafafa"; # default foreground
      base06 = "#ffffff"; # light foreground
      base07 = "#c4c4c4"; # light background
      base08 = "#ffb8e1"; # red (errors, deletion)
      base09 = "#ffd190"; # orange
      base0A = "#fff997"; # yellow (warnings, modification)
      base0B = "#a7ffce"; # green (addition)
      base0C = "#b2feff"; # cyan
      base0D = "#ffffff"; # blue (keywords, functions)
      base0E = "#d7aaff"; # magenta
      base0F = "#c4c4c4"; # deprecated, secondary
    };

    # waiting for niri blur support
    # opacity = {
    #   applications = 0.9;
    #   terminal = 0.9;
    #   popups = 0.9;
    #   desktop = 0.9;
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
