{ pkgs, ... }:
{
  programs.mangowc.enable = true;
  services.hypridle.enable = true;
  services.dunst.enable = true;
  services.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock
  ];
}
