{ pkgs, inputs, ... }:
{
  programs = {
    niri.enable = true;
    fish.enable = true;
    zoxide.enable = true;
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

  # Gstreamer
  # enable the A/V Properties for Nautilus
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

    # style
    adw-gtk3
    adwaita-icon-theme
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.qt6ct
    libsForQt5.qt5ct
    papirus-icon-theme

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

    # desktop
    anki
    ente-auth
    ente-desktop
    freetube
    fuzzel
    gimp
    inputs.waybar.packages.${pkgs.system}.default
    jellyfin-desktop
    kitty
    libreoffice
    localsend
    mako
    moonlight-qt
    mpris-notifier
    mpv
    nautilus # niri portal dependency
    newsflash
    nwg-look
    openrgb
    pavucontrol
    seahorse
    signal-desktop
    swaybg
    swayidle
    stasis
    hypridle
    sway-audio-idle-inhibit
    swaylock
    transmission_4-gtk
    udiskie
    xwayland-satellite
    zed-editor
  ];
}
