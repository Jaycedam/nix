{
  polarity = "dark";
  base16Scheme = {
    base00 = "#1a1b26";
    base01 = "#16161e";
    base02 = "#2f3549";
    base03 = "#444b6a";
    base04 = "#787c99";
    base05 = "#a9b1d6";
    base06 = "#cbccd1";
    base07 = "#d5d6db";
    base08 = "#c0caf5";
    base09 = "#a9b1d6";
    base0A = "#0db9d7";
    base0B = "#9ece6a";
    base0C = "#b4f9f8";
    base0D = "#2ac3de";
    base0E = "#bb9af7";
    base0F = "#f7768e";
  };
  image = {
    url = "https://w.wallhaven.cc/full/p8/wallhaven-p88lvp.jpg";
    hash = "sha256-GSV1fEwV4p1e0f72cyGhKuOKGWDSvbhejJOSuEYQweI=";
  };

  nixvim.colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
      transparent = true;
    };
  };
}
