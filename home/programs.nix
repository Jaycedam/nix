{ pkgs, ... }: {
  programs = {
    home-manager.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    jq.enable = true;
    parallel.enable = true;
    ripgrep.enable = true;
    yt-dlp.enable = true;
    anki.enable = true;
    freetube.enable = true;
    mpv.enable = true;
    zed-editor.enable = true;
  };

  home.packages = with pkgs; [
    # cli
    bluetui
    brightnessctl
    ddcutil
    exfatprogs
    ffmpeg
    fwupd
    imagemagick
    impala
    libnotify
    tealdeer
    trash-cli
    unrar
    wiremix
    wl-clipboard

    # style
    adw-gtk3
    adwaita-icon-theme
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.qt6ct
    libsForQt5.qt5ct
    papirus-icon-theme

    # fonts
    dejavu_fonts
    font-awesome
    jetbrains-mono
    liberation_ttf
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # desktop
    ente-auth
    ente-desktop
    gimp
    proton-vpn
    jellyfin-desktop
    smassh
    kopuz
    libreoffice
    localsend
    lollypop
    moonlight-qt
    nautilus
    nicotine-plus
    nirius
    pavucontrol
    seahorse
    signal-desktop
    transmission_4-gtk
  ];
}
