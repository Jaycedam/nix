# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    "/etc/nixos/hardware-configuration.nix"
  ];

  nixpkgs.overlays = [
    # neovim nightly
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      }
    ))
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-9b198792-4f79-44e0-a9d0-d9cdbbaa08fb".device =
    "/dev/disk/by-uuid/9b198792-4f79-44e0-a9d0-d9cdbbaa08fb";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
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
  users.users.jay = {
    isNormalUser = true;
    description = "Jay";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ### cli ###
    impala # wifi tui selector
    btop
    fzf
    trash-cli
    tldr
    tmux
    ripgrep
    zoxide
    yt-dlp
    yazi
    bat
    fd
    kanata
    jq
    # imagemagick
    # typst
    lsfg-vk
    grim
    slurp
    fwupd
    fastfetch
    sunshine

    # desktop
    signal-desktop
    gimp
    mpv
    libreoffice-fresh
    transmission_4-gtk
    # cryptomator
    # ente-desktop-bin
    # grayjay
    localsend
    xfce.thunar

    # terminal emulators
    kitty
    # ghostty

    ### browser ###
    brave

    ### gaming ###
    gamemode
    gamescope
    # dolphin-emu
    # shadps4
    # gopher64
    heroic
    protonplus
    # pcsx2

    # gtk themes
    graphite-gtk-theme

    ### hyprland and utilities ###
    hyprpaper
    hyprpolkitagent
    dunst
    udiskie
    pavucontrol
    rofi
    nwg-look

    ### dev ###
    # tools
    git
    bun
    tree-sitter
    lazygit
    nodejs_24
    docker
    docker-compose
    # android-tools
    gh
    # ai
    opencode
    gemini-cli
    # editors
    neovim
    helix
    # zed-editor
    # languages
    go

    # lsp
    nil # nix
    pyright
    vscode-langservers-extracted
    typescript-language-server
    rust-analyzer
    astro-language-server
    gopls
    bash-language-server
    marksman
    tailwindcss-language-server
    yaml-language-server
    lua-language-server
    taplo
    # formatters
    nixfmt
    prettier
    ruff
    djlint
    shfmt
    stylua
    black
    # linters
    eslint
    shellcheck
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    font-awesome
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    hyprlock.enable = true;

    waybar.enable = true;
    fish.enable = true;
    steam = {
      enable = true;
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

  services = {
    openssh.enable = true;
    hypridle.enable = true;
    gnome.gnome-keyring.enable = true;
    getty.autologinUser = "jay"; # login automatically on console
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
