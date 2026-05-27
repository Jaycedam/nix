{ pkgs, ... }:
{
  programs = {
    tmux.enable = true;
    bat.enable = true;
    zoxide.enable = true;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    dejavu_fonts
    font-awesome
  ];

  environment.systemPackages = with pkgs; [
    # cli
    nh
    zed-editor
    slurp
    grim
    parallel
    matugen
    yazi
    stow
    btop
    eza
    fzf
    fwupd
    playerctl
    brightnessctl
    impala
    wl-clipboard
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

    # style
    adwaita-icon-theme
    kdePackages.breeze-icons
    bibata-cursors
    adw-gtk3
    whitesur-icon-theme
    candy-icons
    papirus-icon-theme

    # desktop
    kitty
    foot
    pavucontrol
    localsend
    emacs
    thunar
    thunar-archive-plugin
    anki
    thunar-media-tags-plugin
    thunar-volman
    thunar-vcs-plugin
    libreoffice
    signal-desktop
    ente-desktop
    jellyfin-desktop
    mpv
    gimp
    nwg-look
    seahorse
    transmission_4-gtk
    moonlight-qt
    freetube
    foot
    kitty
  ];
}
