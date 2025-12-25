{ ... }:
{
  # big configurations will be loaded from ./programs
  imports = [
    ./programs/hyprland.nix
    ./programs/waybar.nix
  ];
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
}
