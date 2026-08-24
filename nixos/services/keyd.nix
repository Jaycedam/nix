{
  services.keyd = {
    enable = true;
    # remaps are based on colemak-dh,
    # but the config is on qwerty so some combos won't make much sense
    keyboards.default.settings = {
      main = {
        a = "overloadt(alt, a, 180)";
        s = "overloadt(meta, s, 180)";
        d = "overloadt(shift, d, 180)";
        f = "overloadt(control, f, 180)";
        g = "overloadt(altgr, g, 180)";
        j = "overloadt(control, j, 180)";
        k = "overloadt(shift, k, 180)";
        l = "overloadt(meta, l, 180)";
        ";" = "overloadt(alt, ;, 180)";

        # Chords
        "w+e" = "backspace";
        "i+o" = "enter";

        space = "overloadt(extend, space, 180)";
      };

      extend = {
        # q = "";
        # w = "";
        # e = "";
        # r = "";
        # t = "";
        # y = "";
        # u = "";
        i = "up";
        # o = "";
        # p = "";

        a = "alt";
        s = "meta";
        d = "shift";
        f = "control";
        g = "altgr";
        h = "backspace";
        j = "left";
        k = "down";
        l = "right";
        ";" = "enter";

        "102nd" = "brightnessdown";
        z = "brightnessup";
        x = "volumedown";
        c = "volumeup";
        v = "mute";
        n = "micmute";
        m = "previoussong";
        comma = "playpause";
        dot = "nextsong";
      };
    };
  };
}
