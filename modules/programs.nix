{
  pkgs,
  user,
  inputs,
  ...
}:
{
  programs = {
    niri.enable = true;
    fish.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 2";
      };
      flake = "/home/${user}/Projects/nix";
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
    xwayland-satellite

    # cli
    bat
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
    imagemagick
    impala
    jq
    libnotify
    neovim
    parallel
    ripgrep
    stow
    tldr
    tmux
    trash-cli
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
    beets
    ente-auth
    ente-desktop
    freetube
    fuzzel
    gimp
    hypridle
    inputs.waybar.packages.${pkgs.system}.default
    jellyfin-desktop
    kitty
    kopuz
    libreoffice
    localsend
    lollypop
    mako
    moonlight-qt
    mpv
    nautilus
    nicotine-plus
    nirius
    pavucontrol
    proton-vpn
    seahorse
    signal-desktop
    supersonic-wayland
    swaybg
    swaylock
    transmission_4-gtk
    udiskie
    zed-editor

    # https://wiki.nixos.org/wiki/Thumbnails
    # thumbnails
    f3d
    ffmpeg-headless
    ffmpegthumbnailer
    gdk-pixbuf
    libavif
    libheif.bin
    libheif.out
    libjxl
    webp-pixbuf-loader
  ];
}
