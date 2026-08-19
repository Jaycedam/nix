{pkgs, ...}: {
  # use xkb config early to load in luks prompt
  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

  services = {
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
          g = "altgr";
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

          # Chords
          "w+e" = "esc";
          "i+o" = "backspace";
          "z+x" = "tab";
          "comma+dot" = "enter";

          space = "overloadt(extend, space, 200)";
        };

        extend = {
          q = "esc";
          w = "tab";
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

          # reset fkeys
          f1 = "f1";
          f2 = "f2";
          f3 = "f3";
          f4 = "f4";
          f5 = "f5";
          f6 = "f6";
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

  # fix for internal keyboards blocking touchpad 'disable-while-typing' action, when using keyd
  environment.etc."libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
    [Serial Keyboards]

    MatchUdevType=keyboard
    MatchName=keyd*keyboard
    AttrKeyboardIntegration=internal
  '';
}
