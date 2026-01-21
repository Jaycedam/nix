{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # Core gaming packages (conditionally included based on platform support)
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (steam.meta.platforms or [])) [
    steam
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (heroic.meta.platforms or [])) [
    heroic
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (gamemode.meta.platforms or [])) [
    gamemode
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (gamescope.meta.platforms or [])) [
    gamescope
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (pcsx2.meta.platforms or [])) [
    pcsx2
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (dolphin-emu.meta.platforms or [])) [
    dolphin-emu
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (protonup-qt.meta.platforms or [])) [
    protonup-qt
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (shadps4.meta.platforms or [])) [
    shadps4
  ] ++ lib.optionals (builtins.elem pkgs.stdenv.hostPlatform.system (gopher64.meta.platforms or [])) [
    gopher64
  ] ++ [
    # Tools that should work on most platforms
    lsfg-vk # lossless scaling on linux
  ];
}
