_: {
  programs = {
    foot = {
      enable = true;
    };
    kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        cursor_trail = 1;
        tab_bar_edge = "top";
      };
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
  };
}
