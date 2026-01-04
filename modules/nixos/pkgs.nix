{ pkgs, user, ... }:
{
  environment.systemPackages = with pkgs; [
    ### cli ###
    grim
    slurp
    fwupd # upgrade firmware
    playerctl
    brightnessctl
    impala # wifi tui selector
    wl-clipboard
    libnotify
    # gaming
    lsfg-vk # lossless scaling on linux
    gamemode
    gamescope
    pcsx2
    dolphin-emu
    shadps4 # no darwin release yet
    pavucontrol
    wiremix
    # desktop
    proton-pass # no darwin release yet
    nautilus # needed by niri
    gimp # no darwin release yet
    libreoffice-fresh

    # desktop
    signal-desktop
    cryptomator
    ente-desktop
    # grayjay
    seahorse # gnome keyring manager

    ### gaming ###
    heroic
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    dms-shell = {
      enable = true;
      enableSystemMonitoring = false;
      enableDynamicTheming = false;
      enableClipboard = false;
      enableCalendarEvents = false;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  services = {
    gnome.gnome-keyring.enable = true;

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

        fn = {
          f1 = "f1";
          f2 = "f2";
          f7 = "f7";
          f8 = "f8";
          f9 = "f9";
          f10 = "f10";
          f11 = "f11";
          f12 = "f12";
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
        };
      };
    };
    getty = {
      autologinOnce = true;
      autologinUser = user; # login automatically on console
    };

    udisks2.enable = true; # this is necessary for udiskie to work

    sunshine = {
      enable = true;
      openFirewall = true;
    };

    openssh.startWhenNeeded = true;
  };
}
