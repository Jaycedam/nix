{
  lib,
  ...
}:
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
      "$menu" = "rofi -show drun --run-command 'uwsm app -- \${cmd}'";
      "$browser" = "brave";
      "$launch" = "launch-or-focus";

      monitor = "HDMI-A-1, 1920x1080@72, auto, 1";

      layerrule = [
        "blur,rofi"
        "blur,waybar"
        "blur,notifications"
        "ignorezero,waybar"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        resize_on_border = true;
        layout = "dwindle;";
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
          passes = 3;
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
        kb_options = "caps:swapescape";
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
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bind = [
        "$mod, T, exec, $launch $terminal"
        "$mod, Q, killactive"
        "$mod SHIFT, Q, exec, uwsm stop"
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

      windowrule = [
        "workspace 1, class:brave-browser"
        "workspace 2, class:kitty"
      ];

    };
  };

  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          "layer" = "bottom";
          "position" = "top";
          "modules-left" = [
            "group/systray"
            "hyprland/window"
          ];
          "modules-center" = [ "hyprland/workspaces" ];
          "modules-right" = [
            "group/pc"
            "clock"
          ];
          "group/systray" = {
            "orientation" = "inherit";
            "modules" = [
              "custom/power"
              "idle_inhibitor"
              "tray"
            ];
          };
          "group/pc" = {
            "orientation" = "inherit";
            "modules" = [
              "network"
              "pulseaudio"
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
            "on-click-right" = "pactl --set-sink-mute 0 toggle";
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
            "format" = "  {:%a %b %d %H:%M} ";
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
        background-color: rgba(0, 0, 0, 0);
        }

        #workspaces,
        #window,
        #tray,
        #clock,
        #network,
        #systray,
        #pc,
        #bluetooth,
        #battery,
        #pulseaudio,
        #backlight,
        #custom-temperature,
        #memory,
        #custom-power,
        #idle_inhibitor {
        border-radius: 10px;
        margin: 0 5px;
        }

        #workspaces,
        #window,
        #clock,
        #systray,
        #pc,
        #bluetooth {
        background-color: @base01;
        margin-top: 5px;
        }
      '';
    };
    hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };

        animations = {
          enabled = true;
          fade_in = {
            duration = 300;
            bezier = "easeOutQuint";
          };
          fade_out = {
            duration = 300;
            bezier = "easeOutQuint";
          };
        };

        # background = [
        #   {
        #     path = "screenshot";
        #     blur_passes = 3;
        #     blur_size = 8;
        #   }
        # ];
      };
    };
  };

  services = {
    udiskie.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "~/.config/wallpapers/wallpaper.jpg";
        wallpaper = ", ~/.config/wallpapers/wallpaper.jpg";

      };
    };
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
}
