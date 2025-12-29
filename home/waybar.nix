{ lib, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        "layer" = "bottom";
        "position" = "bottom";

        "modules-left" = [
          "group/actions"
          "hyprland/window"
        ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [
          "tray"
          "group/system"
          "clock"
        ];

        "group/actions" = {
          "orientation" = "inherit";
          "modules" = [
            "custom/power"
            "idle_inhibitor"
          ];
        };

        "group/system" = {
          "orientation" = "horizontal";
          "modules" = [
            "network"
            "bluetooth"
            "battery"
            "pulseaudio"
            "backlight"
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
          "tooltip-format" = "Connected to {essid}";
          "format-linked" = "󱘖 {ifname} (No IP)";
          "format-disconnected" = " Disconnected";
          "interval" = 3;
          "on-click" = "kitty --class 'wifi-tui' nmtui";
        };
        "hyprland/language" = {
          "format" = "{short}";
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
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁  0%";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol -t 3";
          "on-click-right" = "pactl --set-sink-mute 0 toggle";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "clock" = {
          "interval" = 1;
          "format" = " {:%a %b %d %H:%M}";
        };
        "tray" = {
          "icon-size" = 16;
          "spacing" = 10;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon}{percent}% ";
          "format-icons" = [
            "󰃞"
            "󰃝"
            "󰃟"
            "󰃠"
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
      * {
        font-family: JetBrains Mono, Symbols Nerd Font;
      }

        window#waybar {
        background-color: rgba(0, 0, 0, 0);
        }

        #tray {
          padding: 0 8px;
        }

        #workspaces button.active {
        color: @base0D;
        }

        #system, #actions,#clock, #tray, #window, #workspaces {
        border-radius: 10px;
        background-color: @base00;
        margin: 0 8px;
        }

        #workspaces,
        #system, #actions,
        #window,
        #tray,
        #clock,
        #network,
        #bluetooth,
        #battery,
        #pulseaudio,
        #backlight,
        #memory,
        #custom-power,
        #idle_inhibitor {
        border-radius: 10px;
        margin: 0 5px;
        }

        #workspaces,
        #system, #actions,
        #window,
        #tray,
        #clock {
        margin-bottom: 8px;
        }
    '';
  };
}
