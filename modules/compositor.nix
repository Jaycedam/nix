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
  ];

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
