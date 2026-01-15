{
  pkgs,
  lib,
  user,
  ...
}:
{
  boot = {
    loader = {
      # Bootloader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      timeout = 1;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    # silent boot with animation

    plymouth = {
      enable = true;
      theme = lib.mkForce "connect";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "connect" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true; # luks gui support
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=false"
    ];

  };

  # Automatic garbage collection (generations) and optimisation
  nix = {
    gc.automatic = true;
    optimise.automatic = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c" # allow ddcutil control
    ];
    shell = pkgs.fish;
    # packages = with pkgs; [ ];
  };

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Required for ddcutil to control ext monitor brightness
  hardware.i2c.enable = true;

  # Enable networking
  networking = {
    wireless.iwd.enable = true;

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      dns = "none"; # we are using dnsproxy for the dns
    };

    nameservers = [
      "127.0.0.1"
      "::1"
    ];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
      };

      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

      server_names = [
        "mullvad-adblock-doh"
        "adguard-dns-doh"
      ];
    };
  };
  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = "dnscrypt-proxy";
}
