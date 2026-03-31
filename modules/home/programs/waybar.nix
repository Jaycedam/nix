{
  lib,
  theme,
  pkgs,
  ...
}:
let
  icon-size = 15;
  spacing = 10;
  launch-or-focus = import ../scripts/niri/launch-or-focus.nix { inherit pkgs; };
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    # todo: check default module settings to reduce loc
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 10;
        # margin = "0 10 0 10";

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "mpris"
          "group/actions"
          "privacy"
          "group/system"
        ];

        # modules customization
        "niri/workspaces" = {
          format = "{index}";
        };

        "niri/window" = {
          max-length = 50;
          icon = true;
          inherit icon-size;
        };

        power-profiles-daemon = {
          "format" = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
          "tooltip" = true;
          "format-icons" = {
            "default" = "󰾅";
            "performance" = "󰓅";
            "balanced" = "󰾅";
            "power-saver" = "󰾆";
          };
        };

        privacy = {
          icon-spacing = spacing;
          inherit icon-size;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = icon-size;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = icon-size;
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
          dynamic-len = 30;
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
          on-click = "${launch-or-focus}/bin/niri-launch-or-focus --tui ${pkgs.impala}/bin/impala";
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
          format = "{icon}";
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
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol -t 3";
          on-click-right = "${pkgs.pulseaudio}/bin/pactl --set-sink-mute 0 toggle";
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
          format = "{:%a, %b %d  %H:%M}";
          on-click = "${launch-or-focus}/bin/niri-launch-or-focus --webapp calendar.proton.me";

          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "shift_reset";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        tray = {
          inherit icon-size spacing;
          show-passive-items = true;
        };

        "group/actions" = {
          orientation = "horizontal";
          modules = [
            "tray"
            "idle_inhibitor"
            "power-profiles-daemon"
          ];
        };

        bluetooth = {
          format = "󰂯";
          format-off = "󰂲";
          format-no-controller = "";
          format-connected = "󰂰";
          tooltip-format = "{controller_alias}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
          on-click = "${launch-or-focus}/bin/niri-launch-or-focus --tui ${pkgs.bluetui}/bin/bluetui";
        };

      };
    };

    style = lib.mkAfter ''
      * {
        font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
      }

      window#waybar {
        border-top: 1px solid @base02;
      }

      .modules-left, .modules-right, .modules-center {
        padding: 0 10px;
      }

      .module {
        padding: 0 10px;
      }

      #idle_inhibitor.activated,
      #network.wifi,
      #bluetooth.connected,
      #power-profiles-daemon.performance {
        color: @base0C;
      }

      #battery.warning, 
      #privacy,
      #power-profiles-daemon.power-saver {
        color: @base09;
      }

      #workspaces button {
        padding: 0 5px;
        border-radius: ${toString theme.border-radius};
        transition: color 0.2s ease;
      }

      #actions {
        background: @base02;
        border-radius: ${toString theme.border-radius};
      }

      #workspaces button.empty, 
      #workspaces button.hidden,
      #bluetooth.off {
        color: @base03;
      }

      #workspaces button.active {
        background-color: @base0D;
        color: @base00;
      }

      /* overrides for stylix */
      .modules-left #workspaces button {
        border-bottom: 0;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
        border-bottom: 0;
      }
      .modules-left #workspaces button.urgent {
        border-bottom: 0;
      }
      .modules-center #workspaces button {
        border-bottom: 0;
      }
      .modules-center #workspaces button.focused,
      .modules-center #workspaces button.active {
        border-bottom: 0;
      }
      .modules-center #workspaces button.urgent {
        border-bottom: 0;
      }
      .modules-right #workspaces button {
        border-bottom: 0;
      }
      .modules-right #workspaces button.focused,
      .modules-right #workspaces button.active {
        border-bottom: 0;
      }
      .modules-right #workspaces button.urgent {
        border-bottom: 0;
      }
    '';
  };
}
