{
  polarity = "dark";
  base16Scheme = {
    base00 = "#1e1e2e";
    base01 = "#181825";
    base02 = "#313244";
    base03 = "#45475a";
    base04 = "#585b70";
    base05 = "#cdd6f4";
    base06 = "#f5e0dc";
    base07 = "#b4befe";
    base08 = "#f38ba8";
    base09 = "#fab387";
    base0A = "#f9e2af";
    base0B = "#a6e3a1";
    base0C = "#94e2d5";
    base0D = "#f5c2e7";
    base0E = "#cba6f7";
    base0F = "#f2cdcd";
  };
  image = {
    url = "https://rose-pine-wallpapers.pages.dev/wallpapers/mix/xavier-cuenca-w4-3.jpg";
    hash = "sha256-67TRNxMCNlOAy/EzlXQqDzYqXKY0QCIwUrJMWbLvtTo=";
  };

  nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = true;
    };
  };
}
