{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xwayland-satellite # xwayland support for niri
  ];

  programs = {
    niri.enable = true;
  };

  # dark theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
