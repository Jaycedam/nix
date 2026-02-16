{
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      # cli
      fwupd # upgrade firmware
      playerctl
      brightnessctl
      impala # wifi tui selector
      wl-clipboard
      libnotify
      ddcutil # ext monitor brightness
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

      # fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
      dejavu_fonts
      jetbrains-mono
      nerd-fonts.symbols-only
      font-awesome

      # icons
      adwaita-icon-theme
      kdePackages.breeze-icons

      # desktop apps
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
      # grayjay
      seahorse # gnome keyring manager
      transmission_4-gtk
      bitwarden-desktop
      spotube
      moonlight-qt

      ### browser ###
      brave

      ### dev ###
      # tools
      bun
      tree-sitter
      lazygit
      nodejs_24
      android-tools
      # languages
      go

      # linters
      eslint
      shellcheck
      statix
    ]
    ++
      lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (proton-pass.meta.platforms or [ ]))
        [
          proton-pass
        ]
    ++
      lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (cryptomator.meta.platforms or [ ]))
        [
          cryptomator
        ];

  programs = {
    btop = {
      enable = true;
    };
    opencode = {
      enable = true;
    };
    gemini-cli.enable = true;

    foot.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
