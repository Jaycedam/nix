{
  pkgs,
  ...
}:
{
  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
  };

  services = {
    udiskie.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "${../../wallpapers/1.jpg}";
        wallpaper = ", ${../../wallpapers/1.jpg}";
      };
    };

    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(200,300)";
          offset = "(10,10)";
          origin = "top-right";
          frame_width = 1;
          corner_radius = 5;
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # home-manager configuration
  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;

      gtk.enable = true;
      x11 = {
        defaultCursor = "Bibata-Modern-Ice";
        enable = true;
      };
    };

    # don't change this
    stateVersion = "25.11";
  };
}
