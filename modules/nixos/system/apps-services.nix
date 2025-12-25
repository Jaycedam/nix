{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ### cli ###
    playerctl
    brightnessctl
    ddcutil
    impala # wifi tui selector
    wl-clipboard
    # gaming
    lsfg-vk # lossless scaling on linux
    ### hyprland and utilities ###
    seahorse
    hyprpolkitagent
    pavucontrol
    nautilus
    rose-pine-hyprcursor
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  services = {
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
        };
      };
    };
    getty = {
      autologinOnce = true;
      autologinUser = "jay"; # login automatically on console
    };
    udisks2.enable = true; # this is necessary for udiskie to work
    gnome.gnome-keyring.enable = true;
    sunshine = {
      enable = true;
      openFirewall = true;
    };
  };

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

}
