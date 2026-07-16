{ pkgs, lib, ... }: {
  programs = {
    niri.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    steam = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
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
