{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  programs = {
    bat = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    fish = {
      enable = true;
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "helix";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    tmux = {
      enable = true;
      prefix = "C-t";
      reverseSplit = true;
      baseIndex = 1;
      escapeTime = 0;
      focusEvents = true;
      historyLimit = 5000;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color";
      extraConfig = ''
        set -g renumber-windows on

        # Set popup border style to "rounded"
        set -g popup-border-lines "rounded"

        # Open windows/panes on the same directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        # Reload config
        bind r source-file "$HOME/.config/tmux/tmux.conf" \; display-message "Config reloaded..."

        #------------------------ Popups --------------------------
        # Session manager
        bind k run-shell '~/.config/tmux/scripts/session.sh > /dev/null 2>&1 || true'
        # lazygit
        bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E lazygit
        # ai
        bind a new-window -c "#{pane_current_path}" -n AI "opencode"
        # Open remote git repository on the Browser
        bind b run-shell "gh browse"
      '';
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    kitty = {
      enable = true;
      settings = {
        cursor_trail = 1;
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
    waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          layer = "bottom";
          position = "top";
          modules-left = [
            "group/systray"
            "hyprland/window"
          ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [
            "group/pc"
            "clock"
          ];
          "group/systray" = {
            orientation = "inherit";
            modules = [
              "custom/power"
              "idle_inhibitor"
              "tray"
            ];
          };
          "group/pc" = {
            orientation = "inherit";
            modules = [
              "network"
              "pulseaudio"
              "bluetooth"
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
          "cpu" = {
            "format" = "{icon} {usage}%";
            "format-icons" = [ "" ];
            "interval" = 10;
            "tooltip" = true;
            "on-click" = "kitty -e btop";
          };
          "memory" = {
            "format" = "{icon} {percentage}%";
            "format-icons" = [ "" ];
            "interval" = 10;
            "tooltip" = true;
            "on-click" = "kitty -e btop";
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
            "on-click-right" = "pactl -- set-sink-mute 0 toggle";
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
            "format" = "  {=%A; %b %d  %H=%M} ";
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
        background-color: rgba(0, 0, 0, 0); /* Transparent bar */
        }

        #workspaces,
        #window,
        #tray,
        #clock,
        #network,
        #systray,
        #pc,
        #resources,
        #bluetooth,
        #battery,
        #pulseaudio,
        #backlight,
        #custom-temperature,
        #memory,
        #custom-power,
        #idle_inhibitor,
        #cpu,
        #memory,
        #cpu {
        border-radius: 10px;
        }

        #workspaces,
        #window,
        #clock,
        #systray,
        #pc,
        #resources,
        #bluetooth {
        background-color: @base01;
        margin-top: 5px;
        }
      '';
    };
    opencode.enable = true;
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
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

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
