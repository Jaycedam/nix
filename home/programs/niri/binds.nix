{
  wayland.windowManager.niri.settings.binds = {
    # niri
    "Mod+Shift+Slash"."show-hotkey-overlay" = {};
    "Mod+Shift+Q"."quit" = {};
    "Mod+O"."toggle-overview" = {};
    "Mod+Q"."close-window" = {};
    "Mod+Shift+V"."toggle-window-floating" = {};
    "Mod+V"."switch-focus-between-floating-and-tiling" = {};
    "Mod+Shift+S"."screenshot" = {};
    "Mod+Shift+C"."center-visible-columns" = {};
    "Mod+C"."center-column" = {};
    "Mod+R"."switch-preset-column-width" = {};
    "Mod+Shift+R"."switch-preset-window-height" = {};
    "Mod+F"."maximize-column" = {};
    "Mod+Shift+F"."fullscreen-window" = {};
    "Mod+Shift+0"."reset-window-height" = {};
    "Mod+Alt+F"."expand-column-to-available-width" = {};

    "Mod+Minus"."set-column-width" = "-10%";
    "Mod+Equal"."set-column-width" = "+10%";
    "Mod+Shift+Minus"."set-window-height" = "-10%";
    "Mod+Shift+Equal"."set-window-height" = "+10%";

    # media keys
    "XF86AudioRaiseVolume"."spawn" = ["volume" "up"];
    "XF86AudioLowerVolume"."spawn" = ["volume" "down"];
    "XF86AudioMute"."spawn" = ["volume" "mute"];
    "XF86AudioMicMute"."spawn" = ["volume" "micmute"];
    "XF86AudioPlay"."spawn" = ["playerctl" "play-pause"];
    "XF86AudioStop"."spawn" = ["playerctl" "stop"];
    "XF86AudioPrev"."spawn" = ["playerctl" "previous"];
    "XF86AudioNext"."spawn" = ["playerctl" "next"];
    "XF86MonBrightnessUp"."spawn" = ["brightness" "up"];
    "XF86MonBrightnessDown"."spawn" = ["brightness" "down"];
    "Ctrl+XF86MonBrightnessUp"."spawn" = ["brightness" "up" "1"];
    "Ctrl+XF86MonBrightnessDown"."spawn" = ["brightness" "down" "1"];
    "Mod+XF86MonBrightnessUp"."spawn" = ["brightnessctl" "-q" "-d" "kbd_backlight" "s" "+25%"];
    "Mod+XF86MonBrightnessDown"."spawn" = ["brightnessctl" "-q" "-d" "kbd_backlight" "s" "25%-"];

    "Mod+Comma"."consume-or-expel-window-left" = {};
    "Mod+Period"."consume-or-expel-window-right" = {};
    "Mod+Left"."focus-column-left" = {};
    "Mod+H"."focus-column-left" = {};
    "Mod+J"."focus-window-or-workspace-down" = {};
    "Mod+Down"."focus-window-or-workspace-down" = {};
    "Mod+K"."focus-window-or-workspace-up" = {};
    "Mod+Up"."focus-window-or-workspace-up" = {};
    "Mod+Right"."focus-column-right" = {};
    "Mod+L"."focus-column-right" = {};
    "Mod+Shift+WheelScrollDown"."focus-column-right" = {};
    "Mod+Shift+WheelScrollUp"."focus-column-left" = {};
    "Mod+WheelScrollDown"."focus-window-or-workspace-down" = {};
    "Mod+WheelScrollUp"."focus-window-or-workspace-up" = {};
    "Mod+Shift+Left"."move-column-left" = {};
    "Mod+Shift+H"."move-column-left" = {};
    "Mod+Shift+Down"."move-window-down-or-to-workspace-down" = {};
    "Mod+Shift+J"."move-window-down-or-to-workspace-down" = {};
    "Mod+Shift+Up"."move-window-up-or-to-workspace-up" = {};
    "Mod+Shift+K"."move-window-up-or-to-workspace-up" = {};
    "Mod+Shift+Right"."move-column-right" = {};
    "Mod+Shift+L"."move-column-right" = {};

    # launch or focus
    "Mod+Y" = {
      _props.hotkey-overlay-title = "Youtube";
      "spawn" = ["launch-or-focus" "--webapp" "www.youtube.com"];
    };
    "Mod+Shift+M" = {
      _props.hotkey-overlay-title = "Mail";
      "spawn" = ["launch-or-focus" "--webapp" "mail.proton.me"];
    };
    "Mod+M" = {
      _props.hotkey-overlay-title = "Music";
      "spawn" = ["launch-or-focus" "--webapp" "open.spotify.com"];
    };
    "Mod+W" = {
      _props.hotkey-overlay-title = "Whatsapp";
      "spawn" = ["launch-or-focus" "--webapp" "web.whatsapp.com"];
    };
    "Mod+B" = {
      _props.hotkey-overlay-title = "Browser";
      "spawn" = ["launch-or-focus" "brave-origin"];
    };
    "Mod+A" = {
      _props.hotkey-overlay-title = "AI (OpenCode)";
      "spawn" = ["launch-or-focus" "--id" "opencode" "dmenu-projects" "opencode"];
    };
    "Mod+Shift+A" = {
      _props.hotkey-overlay-title = "AI (OpenCode new instance)";
      "spawn" = ["dmenu-projects" "opencode"];
    };
    "Mod+N" = {
      _props.hotkey-overlay-title = "Neovim";
      "spawn" = ["launch-or-focus" "--id" "nvim" "dmenu-projects" "nvim"];
    };
    "Mod+Shift+N" = {
      _props.hotkey-overlay-title = "Neovim (new instance)";
      "spawn" = ["dmenu-projects" "nvim"];
    };
    "Mod+E" = {
      _props.hotkey-overlay-title = "File manager";
      "spawn" = ["launch-or-focus" "--tui" "yazi"];
    };
    "Mod+T" = {
      _props.hotkey-overlay-title = "Terminal";
      "spawn" = ["launch-or-focus" "--id" "kitty" "kitty" "-1"];
    };

    "Mod+P" = {
      _props.hotkey-overlay-title = "Power menu";
      "spawn" = "dmenu-power";
    };
    "Mod+D" = {
      _props.hotkey-overlay-title = "Dismiss notification";
      "spawn" = ["makoctl" "dismiss"];
    };
    "Mod+Space" = {
      _props.hotkey-overlay-title = "Launcher";
      "spawn" = "fuzzel";
    };
    "Mod+Slash" = {
      _props.hotkey-overlay-title = "Quick access terminal";
      "spawn" = ["kitten" "quick-access-terminal"];
    };
    "Mod+G" = {
      _props.hotkey-overlay-title = "Toggle global window (pin)";
      "spawn" = ["nirius" "toggle-follow-mode"];
    };

    # todo: loop this
    "Mod+1"."focus-workspace" = 1;
    "Mod+2"."focus-workspace" = 2;
    "Mod+3"."focus-workspace" = 3;
    "Mod+4"."focus-workspace" = 4;
    "Mod+5"."focus-workspace" = 5;
    "Mod+6"."focus-workspace" = 6;
    "Mod+7"."focus-workspace" = 7;
    "Mod+8"."focus-workspace" = 8;
    "Mod+9"."focus-workspace" = 9;
    "Mod+Shift+1"."move-column-to-workspace" = 1;
    "Mod+Shift+2"."move-column-to-workspace" = 2;
    "Mod+Shift+3"."move-column-to-workspace" = 3;
    "Mod+Shift+4"."move-column-to-workspace" = 4;
    "Mod+Shift+5"."move-column-to-workspace" = 5;
    "Mod+Shift+6"."move-column-to-workspace" = 6;
    "Mod+Shift+7"."move-column-to-workspace" = 7;
    "Mod+Shift+8"."move-column-to-workspace" = 8;
    "Mod+Shift+9"."move-column-to-workspace" = 9;
  };
}
