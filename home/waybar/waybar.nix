{
  lib,
  compositor,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = lib.mkMerge [
      {
        mainBar = {
          layer = "top";
          position = "bottom";
          margin-bottom = 5;
          modules-right = [
            "mpris"
            "tray"
            "group/actions"
            "group/system"
          ];

          modules-center = [
            "clock"
          ];

          "group/actions" = {
            orientation = "inherit";
            modules = [
              "custom/power"
              "idle_inhibitor"
            ];
          };

          "group/system" = {
            orientation = "horizontal";
            modules = [
              "network"
              "bluetooth"
              "battery"
              "pulseaudio"
              "backlight"
            ];
          };

          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              persistent = "";
              empty = "";
            };
            persistent-workspaces = {
              "*" = 5;
            };
          };

          "hyprland/window" = {
            format = "{title}";
            max-length = 30;
            icon = true;
            icon-size = 16;
          };

          "niri/workspaces" = {
            format = "{icon}";
            format-icons = {
              browser = "";
              dev = "";
              communication = "";
              default = "";
            };
          };

          "niri/window" = {
            format = "{title}";
            max-length = 30;
            icon = true;
            icon-size = 16;
          };

          mpris = {
            format = "{player_icon} {dynamic}";
            format-paused = "{status_icon} {dynamic}";
            dynamic-order = [
              "title"
              "artist"
            ];
            dynamic-len = 30;
            player-icons = {
              "default" = "";
            };
            status-icons = {
              paused = "";
            };
          };

          "custom/power" = {
            format = "";
            on-click = "dmenu-power";
          };

          network = {
            format-wifi = "  ";
            format-ethernet = " Wired";
            tooltip-format = "Connected to {essid}";
            format-linked = "󱘖 {ifname} (No IP)";
            format-disconnected = " Disconnected";
            interval = 3;
            on-click = "kitty --class 'impala' impala";
          };

          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            interval = 1;
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            tooltip = true;
          };
          pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = " 0%";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "pavucontrol -t 3";
            on-click-right = "pactl --set-sink-mute 0 toggle";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
          clock = {
            interval = 1;
            format = " {:%a %b %d %H:%M}";
            on-click = "niri-launch-or-focus-webapp calendar.proton.me";
            tooltip = false;
          };
          tray = {
            icon-size = 16;
            spacing = 10;
          };
          backlight = {
            device = "intel_backlight";
            format = "{icon}{percent}% ";
            format-icons = [
              "󰃞"
              "󰃝"
              "󰃟"
              "󰃠"
            ];
          };
          bluetooth = {
            format = " {status}";
            format-no-controller = "";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias}{device_battery_percentage}%";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
            on-click = "kitty --class 'bluetui' bluetui";
          };
        };
      }
      (lib.mkIf (compositor == "niri") {
        mainBar = {
          modules-left = [
            "niri/workspaces"
            "niri/window"
          ];
        };
      })
      (lib.mkIf (compositor == "hyprland") {
        mainBar = {
          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];
        };
      })
    ];
    style = ''
        @import "colors.css";

        * {
          font-family: "DejaVu Sans", "Font Awesome 6 Free";
          font-size: 12px;
        }

        window#waybar {
          background-color: transparent;
          color: @on_background;
        }

        tooltip {
            background: @background;
            border: .5px solid @outline_variant;
        }
        tooltip label {
            color: @on_background;
        }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: @on_background;
      }

        #workspaces button.empty {
          color: @outline_variant;
        }

        #workspaces button.active {
          color: @primary;
        }

        #workspaces,
        #window,
        #mpris,
        #system,
        #actions,
        #clock,
        #tray {
          border-radius: 10px;
          border: .2px solid @outline_variant;
          background-color: @background;
          margin: 0 5px;
        }

        window#waybar.empty #window {
          border: transparent;
          background-color: transparent;
        }

        #window,
        #clock,
        #mpris,
        #tray,
        #custom-power,
        #idle_inhibitor,
        #network,
        #bluetooth,
        #battery,
        #pulseaudio,
        #backlight {
          padding: 0 10px;
        }
    '';
  };
}
