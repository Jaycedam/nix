{
  pkgs,
  user,
  ...
}:
{
  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    foot = {
      enable = true;
    };
  };

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "${../../wallpapers/1.jpg}";
        wallpaper = ", ${../../wallpapers/1.jpg}";
      };

      # 0.8 future syntax
      # settings.wallpaper.path = "${../../wallpapers/1.jpg}";
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
        urgency_low = {
          highlight = "#ffffff";
        };
        urgency_normal = {
          highlight = "#ffffff";
        };
        urgency_high = {
          highlight = "#ffffff";
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # home-manager configuration
  home = {
    username = user;
    homeDirectory = "/home/${user}";
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
