{ pkgs, ... }: {
  programs = {
    fzf.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with final.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];

  home.packages = with pkgs; [
    # cli
    bluetui
    brightnessctl
    beets
    ddcutil
    exfatprogs
    fd
    ffmpeg
    fwupd
    grim
    imagemagick
    impala
    jq
    libnotify
    nh
    parallel
    playerctl
    pstree
    ripgrep
    slurp
    stow
    tldr
    trash-cli
    tree
    unrar
    wiremix
    wl-clipboard
    yt-dlp
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
    anki
    ente-auth
    ente-desktop
    freetube
    nicotine-plus
    gimp
    jellyfin-desktop
    libreoffice
    localsend
    moonlight-qt
    mpris-notifier
    mpv
    nautilus
    nirius
    nwg-look
    openrgb
    pavucontrol
    seahorse
    signal-desktop
    swaybg
    swayidle
    stasis
    transmission_4-gtk
    udiskie
    zed-editor
  ];
}
