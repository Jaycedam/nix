{ ... }:
{
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
    userSettings = {
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-window-detected = [
        {
          "if".app-name-regex-substring = "Brave Browser|Safari|Zen|Google Chrome|Chromium|Vivaldi|Firefox";
          run = [ "move-node-to-workspace 1" ];
        }

        {
          "if".app-name-regex-substring = "Ghostty|Kitty|Alacritty";
          run = [ "move-node-to-workspace 2" ];
        }

        {
          "if".app-name-regex-substring = "Mail|Calendar";
          run = [ "move-node-to-workspace 3" ];
        }

        {
          "if".app-name-regex-substring = "WhatsApp|Signal";
          run = [ "move-node-to-workspace 4" ];
        }

        {
          "if".app-name-regex-substring = "Spotify|Apple Music";
          run = [ "move-node-to-workspace 5" ];
        }

        {
          "if".app-name-regex-substring = "Steam Helper|Heroic";
          run = [ "move-node-to-workspace 6" ];
        }
      ];

      gaps = {
        outer.left = 8;
        outer.bottom = 8;
        outer.top = 8;
        outer.right = 8;
        inner.horizontal = 8;
        inner.vertical = 8;
      };

      mode.main.binding = {
        # Layout commands
        "alt-period" = "layout tiles horizontal vertical";
        "alt-comma" = "layout accordion horizontal vertical";

        # Focus
        "alt-left" = "focus left";
        "alt-down" = "focus down";
        "alt-up" = "focus up";
        "alt-right" = "focus right";

        "alt-h" = "focus left";
        "alt-j" = "focus down";
        "alt-k" = "focus up";
        "alt-l" = "focus right";

        "alt-e" = "macos-native-fullscreen";
        "alt-shift-e" = "layout floating tiling";
        "alt-shift-s" = "reload-config";

        # Move nodes
        "alt-shift-left" = "move left";
        "alt-shift-down" = "move down";
        "alt-shift-up" = "move up";
        "alt-shift-right" = "move right";

        "alt-shift-h" = "move left";
        "alt-shift-j" = "move down";
        "alt-shift-k" = "move up";
        "alt-shift-l" = "move right";

        # Resize
        "alt-minus" = "resize smart -50";
        "alt-equal" = "resize smart +50";

        # Workspaces
        "alt-1" = "workspace 1"; # browsers
        "alt-2" = "workspace 2"; # dev tools
        "alt-3" = "workspace 3"; # organization
        "alt-4" = "workspace 4"; # communication
        "alt-5" = "workspace 5"; # media
        "alt-6" = "workspace 6"; # gaming
        "alt-7" = "workspace 7"; # rest
        "alt-8" = "workspace 8"; # rest
        "alt-9" = "workspace 9"; # rest

        # Move nodes to workspace
        "alt-shift-1" = "move-node-to-workspace 1 --focus-follows-window";
        "alt-shift-2" = "move-node-to-workspace 2 --focus-follows-window";
        "alt-shift-3" = "move-node-to-workspace 3 --focus-follows-window";
        "alt-shift-4" = "move-node-to-workspace 4 --focus-follows-window";
        "alt-shift-5" = "move-node-to-workspace 5 --focus-follows-window";
        "alt-shift-6" = "move-node-to-workspace 6 --focus-follows-window";
        "alt-shift-7" = "move-node-to-workspace 7 --focus-follows-window";
        "alt-shift-8" = "move-node-to-workspace 8 --focus-follows-window";
        "alt-shift-9" = "move-node-to-workspace 9 --focus-follows-window";

        # App shortcuts
        "alt-f" = "exec-and-forget open -a Kitty";
        "alt-t" = "exec-and-forget open -a 'Brave Browser'";

        # Workspace navigation
        "alt-tab" = "workspace-back-and-forth";
        "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
      };

    };
  };
}
