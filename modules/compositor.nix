{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mako
    fuzzel
    waybar
    swaybg
    swayidle
    swaylock
    xwayland-satellite
    nirius
  ];

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
    mangowc.enable = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
