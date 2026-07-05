{ pkgs, inputs, ... }:
{
  # https://wiki.hypr.land/Configuring/Start/#autocompletions
  # symlinks from store to the expected location
  systemd.tmpfiles.rules = [
    "L+ /usr/share/hypr/stubs - - - - ${pkgs.hyprland}/share/hypr/stubs"
  ];

  environment.systemPackages = with pkgs; [
    mako
    fuzzel
    inputs.waybar.packages.${pkgs.system}.default
    swaybg
    swayidle
    swaylock
    xwayland-satellite
    nirius
  ];

  programs = {
    niri.enable = true;
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };

  # manual polkit agent, no nixos option is available yet
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "MATE PolicyKit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
