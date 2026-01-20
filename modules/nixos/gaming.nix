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
    # launchers
    heroic
    # tools
    lsfg-vk # lossless scaling on linux
    gamemode
    gamescope
    # emulators
    pcsx2
    dolphin-emu
    shadps4
  ];
}
