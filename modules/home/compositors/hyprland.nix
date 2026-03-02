{ lib, theme, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "super";
      "$launcher" = "fuzzel";
      "$terminal" = "kitty";
      "$browser" = "brave";
      "$editor" = "nvim";
      "$filemanager" = "yazi";

      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh_iso";
        kb_options = "caps:swapescape";
        touchpad.natural_scroll = true;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      general = {
        gaps_out = 10;
        border_size = 3;
        resize_on_border = true;
      };

      decoration = {
        rounding = theme.borderRadius;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        shadow.enabled = false;
      };

      windowrule = [
        {
          name = "suppress-maximize-events";
          match.class = ".*";
          suppress_event = "maximize";
        }
        {
          name = "fix-xwayland-drags";

          match = {
            class = "^$";
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }
        {
          name = "move-hyprland-run";
          match.class = "hyprland-run";
          move = "20 monitor_h-120";
          float = true;
        }
      ];

      bind = [
        "$mod,space,exec,$launcher"
        "$mod,t,exec,$terminal"
        "$mod,b,exec,$browser"
        "$mod,e,exec,$filemanager"
        "$mod,q,killactive,"
        "$mod,v,togglefloating,"

        "$mod,left,movefocus,l"
        "$mod,right,movefocus,r"
        "$mod,up,movefocus,u"
        "$mod,down,movefocus,d"

        "$mod+shift,left,swapwindow,l"
        "$mod+shift,right,swapwindow,r"
        "$mod+shift,up,swapwindow,u"
        "$mod+shift,down,swapwindow,d"

        "$mod, z, togglespecialworkspace, magic"
        "$mod shift, z, movetoworkspace, special:magic"
      ]
      ++ builtins.map (i: "$mod,${toString i},workspace,${toString i}") (lib.range 1 9)
      ++ builtins.map (i: "$mod+shift,${toString i},movetoworkspace,${toString i}") (lib.range 1 9)
      ++ [
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "bindm = $mod, mouse:272, movewindow"
        "bindm = $mod, mouse:273, resizeactive"

        ",XF86AudioRaiseVolume, exec, volume up"
        ",XF86AudioLowerVolume, exec, volume down"
        ",XF86AudioMute, exec, volume mute"
        "shift,XF86AudioMute, exec, volume micmute"
        ",XF86MonBrightnessUp, exec, brightness up"
        ",XF86MonBrightnessDown, exec, brightness down"

        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
