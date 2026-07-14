{ pkgs, ... }: {
  programs = {
    niri.enable = true;
    fish.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite

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
