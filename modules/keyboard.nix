_: {
  # use xkb config for tty, early for luks prompt
  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

  services = {
    # colemak-dh keyboard layout xkb
    xserver.xkb = {
      layout = "us";
      variant = "colemak_dh_iso";
    };

    keyd = {
      enable = true;
      # remaps are based on colemak-dh,
      # but the config is on qwerty so some combos won't make much sense
      keyboards.default.settings = {
        main = {
          a = "overloadt(alt, a, 200)";
          s = "overloadt(meta, s, 200)";
          d = "overloadt(shift, d, 200)";
          f = "overloadt(control, f, 200)";
          j = "overloadt(control, j, 200)";
          k = "overloadt(shift, k, 200)";
          l = "overloadt(meta, l, 200)";
          ";" = "overloadt(alt, ;, 200)";

          # Brightness
          f1 = "brightnessdown";
          f2 = "brightnessup";

          # Media
          f7 = "previoussong";
          f8 = "playpause";
          f9 = "nextsong";

          # Volume
          f10 = "mute";
          f11 = "volumedown";
          f12 = "volumeup";

          space = "overloadt(nav_layer, space, 200)";
        };

        nav_layer = {
          h = "left";
          j = "down";
          k = " up";
          l = "right";
          # forward word
          w = "C-right";
          # backward word
          t = "C-left";
          i = "backspace";
          ";" = "enter";

          f1 = "f1";
          f2 = "f2";
          f7 = "f7";
          f8 = "f8";
          f9 = "f9";
          f10 = "f10";
          f11 = "f11";
          f12 = "f12";
        };
      };
    };
  };
}
