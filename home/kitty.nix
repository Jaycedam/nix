{ lib, pkgs, asahi ? false, ... }:
{
  programs.kitty = {
    enable = true;
    package = lib.mkIf asahi null;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrains Mono";
      size = 14;
    };
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      cursor_trail = 1;
      background_blur = 64;
      tab_bar_edge = "top";
      include = "colors.conf";
    };
  };
}
