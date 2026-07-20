{
  pkgs,
  lib,
  pkgs-pinned,
  ...
}:
{
  programs = {
    gamemode.enable = true;
    steam = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  environment.systemPackages =
    with pkgs;
    [
      mangohud
      duckstation
      gamescope
      lsfg-vk
      ryubing
      dolphin-emu
      gopher64
      pkgs-pinned.rpcs3
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isx86_64 [
      pcsx2
      shadps4
      heroic
    ];
}
