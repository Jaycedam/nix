{
  pkgs,
  lib,
  user,
  ...
}: {
  programs = {
    niri.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;

    nh = {
      enable = true;
      flake = "/home/${user}/Projects/nix-config";

      clean = {
        enable = true;
        extraArgs = "--keep 2";
      };
    };

    steam = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };

  environment.systemPackages = with pkgs; [
    # libvirt networking
    dnsmasq
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
