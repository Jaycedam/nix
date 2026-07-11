{ pkgs, lib, host, ... }:
let
  ryubingPkg = if host == "asahi" then
    pkgs.ryubing.overrideAttrs (old: {
      makeWrapperArgs = (old.makeWrapperArgs or []) ++ [
        "--set AVALONIA_GLOBAL_SCALE_FACTOR 2"
      ];
    })
  else
    pkgs.ryubing;
in
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
      gamemode
      mangohud
      gamescope
      lsfg-vk
      ryubingPkg
      dolphin-emu
      # gopher64
      # rpcs3
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isx86_64 [
      pcsx2
      shadps4
      heroic
    ];
}
