{ pkgs, ... }:
{
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

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # cli
    zoxide
    tmux
    bat
    neovim
    nh
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
    exfatprogs

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

    # desktop
    kitty
    pavucontrol
    localsend
    thunar
    thunar-archive-plugin
    anki
    thunar-media-tags-plugin
    thunar-volman
    udiskie
    thunar-vcs-plugin
    libreoffice
    signal-desktop
    transmission_4-gtk
    ente-desktop
    openrgb
    jellyfin-desktop
    mpv
    gimp
    nwg-look
    seahorse
    moonlight-qt
    freetube
    zed-editor

    # desktop files
    # for webapps we use the format `brave-<url>__-Default` to match the class name since it can't be changed
    # this way waybar can detect the correct icon
    (pkgs.makeDesktopItem {
      name = "brave-open.spotify.com__-Default";
      desktopName = "Spotify";
      exec = "brave --app=https://open.spotify.com";
      icon = "spotify";
      categories = [
        "Audio"
        "Music"
        "Network"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "brave-web.whatsapp.com__-Default";
      desktopName = "WhatsApp";
      exec = "brave --app=https://web.whatsapp.com";
      icon = "whatsapp";
      categories = [
        "Chat"
        "Network"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "brave-mail.proton.me__-Default";
      desktopName = "Proton Mail";
      exec = "brave --app=https://mail.proton.me";
      icon = "proton-mail";
      categories = [
        "Office"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "brave-drive.proton.me__-Default";
      desktopName = "Proton Drive";
      exec = "brave --app=https://drive.proton.me";
      icon = ../assets/icons/proton-drive.svg;
      categories = [
        "Office"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "brave-www.youtube.com__-Default";
      desktopName = "YouTube";
      exec = "brave --app=https://www.youtube.com";
      icon = "youtube";
      categories = [
        "AudioVideo"
        "Network"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "lazygit";
      desktopName = "Lazygit";
      exec = "kitty --app-id git lazygit";
      icon = "git";
      categories = [
        "Development"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "bluetui";
      desktopName = "Bluetui (bluetooth settings)";
      exec = "kitty --app-id bluetui bluetui";
      icon = "preferences-bluetooth";
      categories = [
        "Settings"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "impala";
      desktopName = "Impala (wifi settings)";
      exec = "kitty --app-id impala impala";
      icon = "nm-device-wireless";
      categories = [
        "Settings"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "neovim";
      desktopName = "Neovim";
      exec = "kitty --app-id neovim neovim";
      icon = "nvim";
      categories = [
        "Development"
      ];
    })
    (pkgs.makeDesktopItem {
      name = "opencode";
      desktopName = "OpenCode";
      exec = "kitty --app-id opencode opencode";
      icon = ../assets/icons/opencode.svg;
      categories = [
        "Development"
      ];
    })
  ];
}
