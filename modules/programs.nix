{ pkgs, ... }:
{
  programs = {
    fish.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  fonts.packages = with pkgs; [
    dejavu_fonts
    font-awesome
    jetbrains-mono
    liberation_ttf
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  environment.systemPackages = with pkgs; [
    # cli
    bat
    bitwarden-cli
    bluetui
    brightnessctl
    btop
    ddcutil
    exfatprogs
    eza
    fastfetch
    fd
    ffmpeg
    fwupd
    fzf
    grim
    imagemagick
    impala
    jq
    libnotify
    neovim
    nh
    parallel
    playerctl
    pstree
    ripgrep
    slurp
    stow
    tldr
    tmux
    trash-cli
    tree
    unrar
    wiremix
    wl-clipboard
    yazi
    yt-dlp
    zoxide

    # style
    adw-gtk3
    adwaita-icon-theme
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.qt6ct
    libsForQt5.qt5ct
    papirus-icon-theme

    # desktop
    anki
    ente-auth
    ente-desktop
    freetube
    gimp
    jellyfin-desktop
    kitty
    libreoffice
    localsend
    moonlight-qt
    mpris-notifier
    mpv
    newsflash
    nwg-look
    openrgb
    pavucontrol
    seahorse
    signal-desktop
    transmission_4-gtk
    udiskie
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
