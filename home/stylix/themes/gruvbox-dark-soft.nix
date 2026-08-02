{ pkgs, ... }: {
  stylix = {
    base16Scheme = {
      base00 = "#32302f";
      base01 = "#3c3836";
      base02 = "#504945";
      base03 = "#665c54";
      base04 = "#bdae93";
      base05 = "#d5c4a1";
      base06 = "#ebdbb2";
      base07 = "#fbf1c7";
      base08 = "#fb4934";
      base09 = "#fe8019";
      base0A = "#fabd2f";
      base0B = "#b8bb26";
      base0C = "#8ec07c";
      base0D = "#83a598";
      base0E = "#d3869b";
      base0F = "#d65d0e";
    };
    polarity = "dark";
    image = pkgs.fetchurl {
      url = "https://github.com/AngelJumbo/gruvbox-wallpapers/blob/main/wallpapers/photography/forest-2.jpg?raw=true";
      hash = "sha256-RqzCCnn4b5kU7EYgaPF19Gr9I5cZrkEdsTu+wGaaMFI=";
    };
  };
}
