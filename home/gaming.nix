{ pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  supported = pkg: builtins.elem system (pkg.meta.platforms or [ ]);
in
{
  home.packages =
    with pkgs;
    builtins.filter supported [
      steam
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
