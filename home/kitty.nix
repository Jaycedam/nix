{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      cursor_trail = 1;
      background_blur = 64;
      tab_bar_edge = "top";
      hide_window_decorations = "titlebar-only"; # darwin only option
    };
  };
}
