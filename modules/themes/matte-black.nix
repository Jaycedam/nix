{ pkgs, ... }:
let
  colors = {
    base00 = "#0f0f0f"; # Default Background
    base01 = "#181818"; # Lighter Background (Used for status bars, line number and folding marks)
    base02 = "#252525"; # Selection Background
    base03 = "#595959"; # Comments, Invisibles, Line Highlighting
    base04 = "#737373"; # Dark Foreground (Used for status bars)
    base05 = "#fafafa"; # Default Foreground, Caret, Delimiters, Operators
    base06 = "#ffffff"; # Light Foreground (Not often used)
    base07 = "#c4c4c4"; # Light Background (Not often used)
    base08 = "#ffb8e1"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#ffd190"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#fff997"; # Classes, Markup Bold, Search Text Background
    base0B = "#a7ffce"; # Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#b2feff"; # Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "#ffffff"; # Functions, Methods, Attribute IDs, Headings
    base0E = "#d7aaff"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "#c4c4c4"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  };
in
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ./matte-black.jpg;
    base16Scheme = colors;

    opacity = {
      applications = 0.9;
      terminal = 0.9;
      popups = 0.9;
      desktop = 0.9;
    };

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
