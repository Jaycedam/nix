{ pkgs, ... }:
{
  programs.mangowc.enable = true;
  services.hypridle.enable = true;
  services.dunst.enable = true;
  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock
    swaybg
    polkit_gnome
  ];
}
