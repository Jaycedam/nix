{ config, pkgs, ... }:

{
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  services = {
    dunst = {
      enable = true;
      config = {
        global = {
          width = "(200,300)";
          height = "(0,150)";
          offset = "(30,50)";
          origin = "top-right";
          transparency = 10;
          frame_color = "#eceff1";
          font = "Droid Sans 9";
        };

        urgency_normal = {
          background = "#37474f";
          foreground = "#eceff1";
          timeout = 10;
        };
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
