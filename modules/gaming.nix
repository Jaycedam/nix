{ pkgs, lib, ... }:
{
  programs.steam = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages =
    with pkgs;
    [
      ryubing
      gamemode
      gamescope
      dolphin-emu
      gopher64
      lsfg-vk
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isx86_64 [
      # not available on arm/asahi
      pcsx2
      shadps4
      heroic
      rpcs3 # works on arm, but usually fails to build
    ];
}
