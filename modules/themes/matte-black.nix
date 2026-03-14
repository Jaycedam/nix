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
    base08 = "#f694ff"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#ffca85"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#fff997"; # Classes, Markup Bold, Search Text Background
    base0B = "#61ffca"; # Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#82e2ff"; # Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "#ffffff"; # Functions, Methods, Attribute IDs, Headings
    base0E = "#a277ff"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "#c4c4c4"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
  };
in
{
  stylix = {
    polarity = "dark";
    image = ./3.jpg;
    base16Scheme = colors;

    icons = {
      enable = true;
      package = pkgs.candy-icons;
      dark = "candy-icons";
      light = "candy-icons";
    };

    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
