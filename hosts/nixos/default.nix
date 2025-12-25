{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-9b198792-4f79-44e0-a9d0-d9cdbbaa08fb".device =
    "/dev/disk/by-uuid/9b198792-4f79-44e0-a9d0-d9cdbbaa08fb";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # base16 automatic theming
  stylix = {
    enable = true;
    polarity = "dark";
    # https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      sizes = {
        applications = 12;
        desktop = 10;
        terminal = 14;
      };
    };
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };
  };

  environment.systemPackages = with pkgs; [
    ### cli ###
    playerctl
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
