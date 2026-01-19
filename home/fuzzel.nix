_: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        include = "~/.config/fuzzel/colors.ini";
        font = "DejaVu Sans:size=14";
        icon-theme = "candy-icons";
      };
    };
  };
}
