{
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "${builtins.readFile ../../programs/hypr/hyprland.conf}";
    # don't install anything with hm, it's installed as a system package with nix
    package = null;
    portalPackage = null;
  };
  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          "layer" = "bottom";
          "position" = "top";
          "modules-left" = [
            "group/systray"
            "hyprland/window"
          ];
          "modules-center" = [ "hyprland/workspaces" ];
          "modules-right" = [
            "group/pc"
            "clock"
          ];
          "group/systray" = {
            "orientation" = "inherit";
            "modules" = [
              "custom/power"
              "idle_inhibitor"
              "tray"
            ];
          };
          "group/pc" = {
            "orientation" = "inherit";
            "modules" = [
              "network"
              "pulseaudio"
            ];
          };
          "hyprland/workspaces" = {
            "format" = "{icon}";
            "format-icons" = {
              "active" = "";
              "persistent" = "";
              "empty" = "";
            };
            "persistent-workspaces" = {
              "*" = 5;
            };
          };
          "custom/power" = {
            "format" = "  ";
            "on-click" = "rofi-power-menu";
          };
          "network" = {
            "format-wifi" = "  ";
            "format-ethernet" = " Wired";
            "tooltip-format" = "{essid} 󰅧 {bandwidthUpBytes} 󰅢 {bandwidthDownBytes}";
            "format-linked" = "󱘖 {ifname} (No IP)";
            "format-disconnected" = " Disconnected";
            "interval" = 3;
            "on-click" = "kitty --class 'wifi-tui' impala";
          };
          "hyprland/language" = {
            "format" = "{long}";
            # "format-en"= "AMERICA; HELL YEAH!";
            "keyboard-name" = "at-translated-set-2-keyboard";
          };
          "hyprland/window" = {
            "format" = "{title}";
            "max-length" = 50;
            "icon" = true;
            "icon-size" = 16;
          };
          "battery" = {
            "states" = {
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{icon} {capacity}%";
            "format-charging" = " {capacity}%";
            "interval" = 1;
            "format-icons" = [
              ""
              ""
              ""
              ""
              ""
            ];
            "tooltip" = true;
          };
          "pulseaudio" = {
            "format" = "{icon}{volume}%";
            "format-muted" = " 󰖁 0% ";
            "format-icons" = {
              "headphone" = "  ";
              "hands-free" = "  ";
              "headset" = "  ";
              "phone" = "  ";
              "portable" = "  ";
              "car" = "  ";
              "default" = [
                "  "
                "  "
                "   "
              ];
            };
            "on-click" = "pavucontrol -t 3";
            "on-click-right" = "pactl --set-sink-mute 0 toggle";
          };
          "idle_inhibitor" = {
            "format" = " {icon} ";
            "format-icons" = {
              "activated" = "";
              "deactivated" = "";
            };
          };
          "clock" = {
            "interval" = 1;
            "format" = "  {:%a %b %d %H:%M} ";
          };
          "tray" = {
            "icon-size" = 12;
            "spacing" = 6;
          };
          "backlight" = {
            "device" = "intel_backlight";
            "format" = "{icon}{percent}% ";
            "format-icons" = [
              " 󰃞 "
              " 󰃝 "
              " 󰃟 "
              " 󰃠 "
            ];
          };
          "bluetooth" = {
            "format" = " {status}";
            "format-no-controller" = "";
            "format-connected" = " {device_alias}";
            "format-connected-battery" = " {device_alias}{device_battery_percentage}%";
            "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            "tooltip-format-connected" =
              "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
            "tooltip-format-enumerate-connected-battery" =
              "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          };
        };
      };
      style = lib.mkAfter ''
        window#waybar {
        background-color: rgba(0, 0, 0, 0);
        }

        #workspaces,
        #window,
        #tray,
        #clock,
        #network,
        #systray,
        #pc,
        #bluetooth,
        #battery,
        #pulseaudio,
        #backlight,
        #custom-temperature,
        #memory,
        #custom-power,
        #idle_inhibitor {
        border-radius: 10px;
        margin: 0 5px;
        }

        #workspaces,
        #window,
        #clock,
        #systray,
        #pc,
        #bluetooth {
        background-color: @base01;
        margin-top: 5px;
        }
      '';
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

        # background = [
        #   {
        #     path = "screenshot";
        #     blur_passes = 3;
        #     blur_size = 8;
        #   }
        # ];
      };
    };
  };

  services = {
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
