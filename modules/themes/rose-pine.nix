{ pkgs, ... }:
{
  config.stylix = {
    enable = true;

    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "151320"; # Default Background
      base01 = "1f1d2e"; # Lighter Background (Used for status bars, line number and folding marks)
      base02 = "26233a"; # Selection Background
      base03 = "6e6a86"; # Comments, Invisibles, Line Highlighting
      base04 = "908caa"; # Dark Foreground (Used for status bars)
      base05 = "e0def4"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "e0def4"; # Light Foreground (Not often used)
      base07 = "524f67"; # Light Background (Not often used)
      base08 = "eb6f92"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "f6c177"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "ebbcba"; # Classes, Markup Bold, Search Text Background
      base0B = "31748f"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "9ccfd8"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "c4a7e7"; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = "f6c177"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "524f67"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    };

    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };

    polarity = "dark";

    image = ./rose-pine.png;
  };
}
