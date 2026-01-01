{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # don't install anything with hm, it's installed as a system package with nix
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "$terminal --class 'file-manager' -e fish -c yazi";
      "$menu" = "rofi -show drun";
      "$browser" = "brave";
      "$launch" = "launch-or-focus";

      animations = {
        enabled = true;
        bezier = [
          "quart, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 3, quart, slide"
          "border, 1, 3, quart"
          "borderangle, 1, 3, quart"
          "fade, 1, 3, quart"
          "workspaces, 1, 3, quart"
        ];
      };

      general = {
        gaps_in = 8;
        gaps_out = 8;
        resize_on_border = true;
      };
      ecosystem = {
        no_donation_nag = true;
      };

      decoration = {
        rounding = 10;
        inactive_opacity = 0.9;
        shadow.enabled = false;
        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 10;
          passes = 2;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        focus_on_activate = true;
        animate_manual_resizes = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh_iso";
      };

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Requires playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightness up"
        ",XF86MonBrightnessDown, exec, brightness down"
      ];

      bind = [
        "$mod, T, exec, $launch $terminal"
        "$mod, Q, killactive"
        "$mod SHIFT, Q, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$mod, E, exec, $fileManager"
        "$mod, B, exec, $launch $browser"
        "$mod, SPACE, exec, $menu"
        "$mod, J, togglesplit, # dwindle"
        "$mod, F, fullscreen,"
        "$mod SHIFT, F, togglefloating,"
        "$mod SHIFT, L, exec, $launch hyprlock"
        "$mod SHIFT, S, exec, grim -g '$(slurp)' # screenshot"

        # Move focus with mod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        # Swap windows around
        "$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"
        # Change window size
        "$mod, equal, resizeactive,  100  100"
        "$mod, minus, resizeactive, -100 -100 }"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );

      layerrule = [
        "blur on, match:class  rofi"
        "blur on, match:class waybar"
        "blur on, match:class notifications"
        "ignore_alpha 0, match:class waybar"
      ];

      windowrule = [
        "workspace 1, match:class brave-browser"
        "workspace 2, match:class kitty"
        # pin gnome-keyring
        "pin on, match:class gcr-prompter"
        "stay_focused on, match:class gcr-prompter"
      ];

    };
  };
}
