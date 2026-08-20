{
  # TODO: simplify config or look for alternative
  programs.waybar.settings.mainBar = {
    "niri/workspaces#main".format = "{value}";

    "niri/workspaces#taskbar" = {
      current-only = true;
      workspace-taskbar.enable = true;
    };

    power-profiles-daemon = {
      format = "{icon}";
      tooltip-format = "Power profile: {profile}\nDriver: {driver}";
      tooltip = true;
      format-icons = {
        default = "󰾅";
        performance = "󰓅";
        balanced = "󰾅";
        power-saver = "󰾆";
      };
    };

    privacy = {
      icon-spacing = 10;
      transition-duration = 250;
      ignore-monitor = true;
      modules = [
        {
          type = "screenshare";
          tooltip = true;
        }
        {
          type = "audio-in";
          tooltip = true;
        }
      ];
      ignore = [
        {
          type = "audio-in";
          name = "cava";
        }
      ];
    };

    clock = {
      interval = 1;
      format = "{:%A, %b %d  %H:%M}";
      tooltip-format = "<tt>{calendar}</tt>";

      calendar.format = {
        months = "<span color='#ffead3'><b>{}</b></span>";
        days = "<span color='#ecc6d9'><b>{}</b></span>";
        weeks = "<span color='#99ffdd'><b>W{}</b></span>";
        weekdays = "<span color='#ffcc66'><b>{}</b></span>";
        today = "<span color='#ff6699'><b><u>{}</u></b></span>";
      };

      actions = {
        on-click-right = "shift_reset";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰝟";
      format-icons = {
        headphone = "󰋋";
        hands-free = "󰋋";
        headset = "󰋋";
        default = ["󰕿" "󰖀" "󰕾"];
      };
      on-click = "pavucontrol -t 3";
      on-click-right = "pactl --set-sink-mute 0 toggle";
    };

    battery = {
      tooltip = true;
      format = "{icon} {capacity}%";
      format-charging = "󱐋 {capacity}%";
      format-critical = "LOW BATTERY {icon} {capacity}%";
      interval = 1;

      states = {
        warning = 30;
        critical = 20;
      };

      format-icons = {
        # TODO: use only 5 icons
        default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
      };
    };

    network = {
      format-wifi = "󰖩";
      format-ethernet = "󰈀";
      tooltip-format = "Connected to {essid}";
      format-linked = "󱎔";
      format-disconnected = "󰀦";
      interval = 3;
      on-click = "launch-or-focus --tui impala";
    };

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "󰅶";
        deactivated = "󰛊";
      };
    };

    tray = {
      spacing = 10;
      show-passive-items = true;
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
      on-click = "launch-or-focus --tui bluetui";
    };
  };
}
