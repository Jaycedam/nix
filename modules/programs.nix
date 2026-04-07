{ pkgs, ... }:
{
  programs = {
    foot.enable = true;
    tmux.enable = true;
    bat.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # cli
    btop
    eza
    fzf
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
    anki
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
    fuzzel
  ];
}
