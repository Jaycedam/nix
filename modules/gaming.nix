{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    heroic
    gamemode
    gamescope
    pcsx2
    dolphin-emu
    protonup-qt
    shadps4
    gopher64
    lsfg-vk
  ];
}
