{pkgs, ...}: {
  imports = [
    ./colors.nix
    ./binds.nix
    ./rules.nix
  ];

  home.packages = with pkgs; [xwayland-satellite];

  wayland.windowManager.niri = {
    enable = true;
    settings = {
      blur.offset = 10; # default 3
      prefer-no-csd = true;
      gestures.hot-corners.off = {};

      _children = [
        {spawn-at-startup = ["niriusd"];}
        {spawn-at-startup = "asahi-fixes";}
        {workspace._args = ["browser"];}
        {workspace._args = ["dev"];}
        {workspace._args = ["media"];}
        {workspace._args = ["chat"];}
        {workspace._args = ["gaming"];}

        {
          output = {
            _args = ["HDMI-A-1"];
            mode = "1920x1080@71.910";
          };
        }
        {
          output = {
            _args = ["eDP-1"];
            scale = 1.7;
          };
        }
      ];

      cursor = {
        hide-after-inactive-ms = 5000;
        hide-when-typing = true;
      };

      input = {
        keyboard.xkb = {
          layout = "us";
          variant = "colemak_dh_iso";
          options = "caps:escape";
        };

        touchpad = {
          dwt = {};
          natural-scroll = {};
          accel-speed = 0.1;
        };
      };

      layout = {
        gaps = 5;
        default-column-width.proportion = 0.8;
        always-center-single-column = {};

        preset-column-widths._children = [
          {proportion = 0.5;}
          {proportion = 0.8;}
        ];
        preset-window-heights._children = [
          {proportion = 1.0 / 2.0;}
          {proportion = 1.0 / 3.0;}
        ];
      };
    };
  };
}
