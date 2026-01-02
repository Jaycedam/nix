{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xwayland-satellite # xwayland support for niri
  ];

  programs = {
    niri.enable = true;
  };

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # implements most of the basic functionality, this is the "default fallback portal".
      xdg-desktop-portal-gnome # required for screencasting support
    ];
  };
}
