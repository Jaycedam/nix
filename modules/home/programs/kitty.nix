_: {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      cursor_trail = 1;
      tab_bar_edge = "top";
    };
  };
}
