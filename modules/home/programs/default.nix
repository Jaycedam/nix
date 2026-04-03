{
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  supported = pkg: builtins.elem system (pkg.meta.platforms or [ ]);
in
{
  imports = [
    ./waybar.nix
    ./fuzzel.nix
    ./desktop-entries.nix
    ./tmux.nix
    ./kitty.nix
    ./yazi.nix
    ./anki.nix
    ./fish.nix
    ./git.nix
    ./ghostty.nix
    ./brave.nix
    ./gaming.nix
    ./swaylock.nix
    ./eza.nix
    ./dev.nix
./neovim
    ./mango
  ];

  programs = {
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
}
