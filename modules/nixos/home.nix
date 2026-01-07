{
  pkgs,
  user,
  config,
  ...
}:
{
  programs = {
    rofi = {
      enable = true;
      theme =
        let
          # Use `mkLiteral` for string-like values that should show without
          # quotes in the config file.
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          "*" = {
            margin = 0;
            padding = 0;
            spacing = 0;
          };

          window = {
            location = mkLiteral "center";
            width = 640;
            border-radius = 8;
            border = mkLiteral "1px";
          };

          icon-search = {
            vertical-align = mkLiteral "0.5";
          };
          entry = {
            vertical-align = mkLiteral "0.5";
          };
          element-icon = {
            vertical-align = mkLiteral "0.5";
          };
          element-text = {
            vertical-align = mkLiteral "0.5";
          };

          inputbar = {
            font = "Montserrat 20";
            padding = mkLiteral "12px";
            spacing = mkLiteral "12px";
            children = mkLiteral "[ icon-search, entry ]";
          };

          icon-search = {
            expand = false;
            filename = "search";
            size = mkLiteral "29px";
          };

          entry = {
            font = mkLiteral "inherit";
            placeholder = "Search";
          };

          message = {
            border = mkLiteral "2px 0 0";
          };

          textbox = {
            padding = mkLiteral "8px 24px";
          };

          listview = {
            lines = 10;
            columns = 1;

            fixed-height = false;
            border = mkLiteral "1px 0 0";
          };

          element = {
            padding = mkLiteral "8px 16px";
            spacing = mkLiteral "16px";
            background-color = mkLiteral "transparent";
          };

          element-icon = {
            size = mkLiteral "1em";
          };

          element-text = {
            text-color = mkLiteral "inherit";
          };
        };
    };
    foot = {
      enable = true;
    };
  };

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;

    dunst = {
      enable = true;
      settings = {
        global = {
          width = "300";
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

    hyprpaper = {
      enable = true;
      settings = {
        wallpaper = {
          monitor = "";
          path = "${../../wallpapers/1.jpg}";
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
