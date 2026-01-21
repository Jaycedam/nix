{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # launchers
    steam
    heroic
    # tools
    lsfg-vk # lossless scaling on linux
    gamemode
    gamescope
    protonup-qt
    # emulators
    pcsx2
    dolphin-emu
    shadps4
    gopher64
  ];
}
