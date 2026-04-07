{ pkgs, ... }:
{
  programs = {
    mangowc.enable = true;
    waybar.enable = true;
  };
  services = {
    hypridle.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mako
    swaylock
    swaybg
    polkit_gnome
  ];
}
