{ lib, theme, ... }:
let
  iconSize = 15;
  spacing = 10;
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = spacing;
        margin = "0 10 5 10";

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "mpris"
          "group/custom-tray"
          "privacy"
          "group/system"
        ];

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            browser = "󰊯";
            dev = "󰞷";
            chat = "󰻞";
            default = "󰝥";
          };
        };

        "niri/window" = {
          format = "{title}";
          max-length = 40;
          icon = true;
          icon-size = iconSize;
        };

        privacy = {
          icon-spacing = 4;
          icon-size = 18;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
          ignore-monitor = true;
          ignore = [
            {
              type = "audio-in";
              name = "cava";
            }
          ];
        };

        mpris = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} {dynamic}";
          dynamic-order = [
            "title"
            "artist"
          ];
          dynamic-len = 40;
          player-icons = {
            default = "󰐍";
          };
          status-icons = {
            paused = "󰏦";
          };
        };

        network = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          tooltip-format = "Connected to {essid}";
          format-linked = "󱎔 {ifname} (No IP)";
          format-disconnected = "󰀦 Disconnected";
          interval = 3;
          on-click = "kitty --class 'impala' impala";
        };

        battery = {
          states = {
            warning = 30;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          interval = 1;
          format-icons = {
            default = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            charging = [
              "󰢟"
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
          };
          tooltip = true;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋋";
            headset = "󰋋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol -t 3";
          on-click-right = "pactl --set-sink-mute 0 toggle";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰛊";
          };
        };
        "group/system" = {
          orientation = "horizontal";
          modules = [
            "network"
            "bluetooth"
            "pulseaudio"
            "battery"
          ];
        };
        clock = {
          interval = 1;
          format = "{:%a %d %b · %H:%M}";
          on-click = "niri-launch-or-focus-webapp calendar.proton.me";
          "tooltip-format" = "<tt>{calendar}</tt>";
          calendar = {
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "shift_reset";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        tray = {
          icon-size = iconSize;
          spacing = spacing;
        };

        "group/custom-tray" = {
          orientation = "horizontal";
          modules = [
            "tray"
            "idle_inhibitor"
          ];
        };

        bluetooth = {
          format = "󰂯";
          format-off = "󰂲";
          format-no-controller = "";
          format-connected = "󰂱";
          tooltip-format = "{controller_alias}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
          on-click = "kitty --class 'bluetui' bluetui";
        };
      };
    };

    style = lib.mkAfter ''
      * {
          font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
      }

      window#waybar {
          background-color: @base00;
          color: @base06;
          border: 1px solid @base02;
          border-radius: ${toString theme.borderRadius}px;
      }

      .module {
          padding: 0 8px;
      }

      tooltip {
          background: @base00;
          border: 1px solid @base0D ;
      }
      tooltip label {
          color: @base00;
      }

      #bluetooth.connected, #network.wifi {
          color: @base0C ;
      }

      #battery.warning {
          color: @base08 ;
      }

      #privacy {
          color: @base09 ;
      }

      #workspaces button {
          transition: color 0.1s ease;
          padding: 0 5px;
          background: transparent;
          border-radius: ${toString theme.borderRadius};
      }

      #custom-tray {
          background: @base02;
          border-radius: ${toString theme.borderRadius};
      }

      #workspaces button.empty,
      #bluetooth.off {
        color: @base03;
      }

      #workspaces button.active {
        color: @base09;
      }

      window#waybar.empty #window {
        border: transparent;
        background-color: transparent;
      }

      #idle_inhibitor.deactivated {
          color: @base03;
      }

      #idle_inhibitor.activated {
          color: @base09;
      }
    '';

  };

  stylix.targets.waybar = {
    addCss = false;
  };

}
