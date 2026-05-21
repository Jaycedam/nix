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
    hyprsunset
  ];

  programs = {
    niri.enable = true;
    hyprland.enable = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
