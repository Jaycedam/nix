{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
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
    trash-cli
    tldr
    ripgrep
    yt-dlp
    fd
    jq
    imagemagick
    fastfetch
    mpv
    bitwarden-cli
    ffmpeg

    # desktop apps
    pavucontrol
    localsend
    nautilus # needed by niri
    gimp
    libreoffice-fresh
    signal-desktop
    ente-desktop
    # grayjay
    seahorse # gnome keyring manager
    transmission_4-gtk
    bitwarden-desktop
    spotube

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
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (proton-pass.meta.platforms or [])) [
    proton-pass
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (cryptomator.meta.platforms or [])) [
    cryptomator
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (docker.meta.platforms or [])) [
    docker
    docker-compose
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "matugen";
        theme_background = false;
      };
    };
    opencode = {
      enable = true;
      settings.theme = "system";
    };

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
