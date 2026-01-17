{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xwayland-satellite # xwayland support for niri
  ];

  programs = {
    niri.enable = true;
  };
}
