{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      cursor_trail = 1;
      # background_opacity = 0.9;
      tab_bar_edge = "top";
    };
  };
}
