{
  pkgs,
  user,
  config,
  ...
}:
{
  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${pkgs.niri}/bin/niri-session";
          inherit user;
        };
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
          user = "greeter";
        };
      };
    };

    gnome.gnome-keyring.enable = true;
    # gnome virtual filesystem for nautilus and other gnome apps
    gvfs.enable = true;

    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };

    keyd = {
      enable = true;
      # remaps are based on colemak-dh,
      # but the config is on qwerty so some combos won't make much sense
      keyboards.default.settings = {
        main = {
          capslock = "esc";
          a = "overloadt(meta, a, 200)";
          s = "overloadt(alt, s, 200)";
          d = "overloadt(shift, d, 200)";
          f = "overloadt(control, f, 200)";
          j = "overloadt(control, j, 200)";
          k = "overloadt(shift, k, 200)";
          l = "overloadt(alt, l, 200)";
          ";" = "overloadt(meta, ;, 200)";

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

    udisks2.enable = true; # this is necessary for udiskie to work

    sunshine = {
      enable = true;
      openFirewall = true;
    };

    openssh.startWhenNeeded = true;
  };
}
