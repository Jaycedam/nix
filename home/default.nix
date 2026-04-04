{
  user,
  config,
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  supported = pkg: builtins.elem system (pkg.meta.platforms or [ ]);
in
{
  imports = [
    ./hypridle.nix
    ./mako.nix
    ./nixvim
    ./waybar.nix
    ./fuzzel.nix
    ./desktop-entries.nix
    ./tmux.nix
    ./terminal.nix
    ./yazi.nix
    ./fish.nix
    ./browser.nix
    ./gaming.nix
    ./swaylock.nix
    ./dev.nix
    ./mango.nix

    ../scripts
  ];

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
    gnome-keyring.enable = true;
    wpaperd.enable = true;
  };

  programs = {
    anki.enable = true;
    btop.enable = true;
    bat.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      colors = "auto";
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
  };

  home.packages =
    with pkgs;
    [
      # cli
      fwupd
      playerctl
      brightnessctl
      impala
      wl-clipboard
      grim
      slurp
      libnotify
      ddcutil
      wiremix
      tree
      pstree
      bluetui
      trash-cli
      tldr
      ripgrep
      yt-dlp
      fd
      jq
      imagemagick
      fastfetch
      bitwarden-cli
      ffmpeg
      unrar

      # fonts and icons
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      dejavu_fonts
      jetbrains-mono
      nerd-fonts.symbols-only
      font-awesome
      adwaita-icon-theme
      kdePackages.breeze-icons

      # desktop
      pavucontrol
      localsend
      thunar
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-volman
      thunar-vcs-plugin
      libreoffice-fresh
      signal-desktop
      ente-desktop
      jellyfin-desktop
      mpv
      gimp
      seahorse
      transmission_4-gtk
      bitwarden-desktop
      moonlight-qt
      freetube
    ]
    ++ builtins.filter supported [
      proton-pass
      cryptomator
    ];

  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    # don't change this!
    stateVersion = "25.11";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      WALLPAPERS = "${config.home.homeDirectory}/Pictures/Wallpapers";
    };
  };
}
