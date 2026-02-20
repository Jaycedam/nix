_:
let
  iconSize = 15;
  spacing = 10;
in
{
  programs.waybar.settings.mainBar = {
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
      icon-spacing = spacing;
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
      on-click = "niri-launch-or-focus-tui impala";
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
      inherit spacing;
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
      on-click = "niri-launch-or-focus-tui bluetui";
    };
  };
}
