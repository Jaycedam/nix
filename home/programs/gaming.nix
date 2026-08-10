{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    [
      mangohud
      duckstation
      gamescope
      lsfg-vk
      ryubing
      dolphin-emu
      gopher64
      # rpcs3
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isx86_64 [
      pcsx2
      shadps4
      heroic
    ];
}
