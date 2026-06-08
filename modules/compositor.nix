{ pkgs, inputs, ... }:
{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  # https://wiki.hypr.land/Configuring/Start/#autocompletions
  # symlinks from store to the expected location
  systemd.tmpfiles.rules = [
    "L+ /usr/share/hypr/stubs - - - - ${pkgs.hyprland}/share/hypr/stubs"
  ];

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
    hyprshutdown
    hypridle
    wlrctl
  ];

  programs = {
    niri.enable = true;
    hyprland.enable = true;
    mango.enable = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
