{
  pkgs,
  ...
}:
{
  home.username = "jay";
  home.homeDirectory = "/home/jay";
  home.pointerCursor = {
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

  # large configs go to ./programs/
  # consider move them all?
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./neovim/default.nix
    ./helix.nix
    ./tmux.nix
  ];

  services = {
    udiskie.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "${../wallpapers/1.jpg}";
        wallpaper = ", ${../wallpapers/1.jpg}";
      };
    };
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
          before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
          after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
        };

        listener = [
          {
            timeout = "150";
            on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
            on-resume = "brightnessctl -r"; # monitor backlight restore.
          }

          # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
          {
            timeout = 150;
            on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
            on-resume = "brightnessctl -rd rgb:kbd_backlight";
          }

          {
            timeout = 300;
            on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
          }

          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
            on-resume = "hyprctl dispatch dpms on && brightnessctl -r"; # screen on when activity is detected after timeout has fired.
          }

          {
            timeout = 1800;
            on-timeout = "systemctl suspend"; # suspend pc
          }
        ];
      };
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(200,300)";
          offset = "(30,50)";
          origin = "top-right";
          corner_radius = 5;
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };

        animations = {
          enabled = true;
          fade_in = {
            duration = 300;
            bezier = "easeOutQuint";
          };
          fade_out = {
            duration = 300;
            bezier = "easeOutQuint";
          };
        };
      };
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
        credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
    };
    bat = {
      enable = true;
    };
    btop.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "hx";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        cursor_trail = 1;
      };
      keybindings = {
        # tmux like keybinds https://sw.kovidgoyal.net/kitty/actions/
        # possible future actions: open_url

        ## tabs
        "ctrl+t>w" = "select_tab";
        "ctrl+t>x" = "close_tab";
        "ctrl+t>n>" = "next_tab";
        "ctrl+t>p" = "previous_tab";
        "ctrl+t>N>" = "move_tab_forward";
        "ctrl+t>P" = "move_tab_backward";
        "ctrl+t>comma" = "set_tab_title";
        "ctrl+t>c" = "new_tab_with_cwd";
        "ctrl+t>t" = "toggle_tab";

        ## windows (splits)
        "ctrl+t>s" = "new_window_with_cwd";

        ## actions
        "ctrl+t>[" = "show_scrollback";
        "ctrl+t>r" = "load_config_file";

        # custom lauch commands
        "ctrl+t>g" = "launch --cwd=current --type=tab 'lazygit'";
        "ctrl+t>a" = "launch --cwd=current --type=tab 'opencode'";
        "ctrl+t>b" = "launch 'gh browse > /dev/null'";
      };
    };
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };

  # don't change this
  home.stateVersion = "25.11";
}
