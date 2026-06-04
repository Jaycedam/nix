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
    bibata-cursors
    adw-gtk3
    whitesur-icon-theme
    candy-icons
    papirus-icon-theme
    kdePackages.breeze
    kdePackages.breeze-icons
    libsForQt5.qt5ct
    kdePackages.qt6ct

    # desktop files for Brave web app icons
    (pkgs.makeDesktopItem {
      name = "spotify";
      desktopName = "Spotify";
      exec = "brave --app=https://open.spotify.com";
      icon = "spotify";
      categories = [ "Audio" "Music" "Network" ];
    })
    (pkgs.makeDesktopItem {
      name = "whatsapp";
      desktopName = "WhatsApp";
      exec = "brave --app=https://web.whatsapp.com";
      icon = "whatsapp";
      categories = [ "Chat" "Network" ];
    })
    (pkgs.makeDesktopItem {
      name = "proton-mail";
      desktopName = "Proton Mail";
      exec = "brave --app=https://mail.proton.me";
      icon = "proton-mail";
      categories = [ "Office" "Network" ];
    })
    (pkgs.makeDesktopItem {
      name = "youtube";
      desktopName = "YouTube";
      exec = "brave --app=https://www.youtube.com";
      icon = "youtube";
      categories = [ "AudioVideo" "Network" ];
    })

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
    moonlight-qt
    freetube
    foot
    kitty
  ];
}
