{ pkgs, lib, ... }:
{
  programs.steam = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    lsfg-vk
    ryubing
    dolphin-emu
    gopher64
    pcsx2
    shadps4
    heroic
    rpcs3
  ];
}
