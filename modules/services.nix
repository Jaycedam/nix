{
  pkgs,
  lib,
  desktop,
  user,
  ...
}:
{
  services = {
    displayManager = {
      ly.enable = true;
      defaultSession = "niri";
      autoLogin = {
        enable = true;
        user = user;
      };
    };
    playerctld.enable = true;
    # run as the real user so it can read/write home dirs.
    syncthing = {
      enable = true;
      user = user;
      group = "users";
      dataDir = "/home/${user}";
      guiAddress = "0.0.0.0:8384";
    };
    userdbd.enable = lib.mkDefault false; # avoids systemd's age verification change
    gvfs.enable = true; # needed for nautilus
    udisks2.enable = true; # this is necessary for udiskie to work
    hardware.openrgb.enable = true;
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };
    sunshine = lib.mkIf desktop {
      enable = true;
      openFirewall = true;
      capSysAdmin = true; # KMS/DRM capture, no portal needed
    };
  };

  # https://wiki.nixos.org/wiki/Polkit
  systemd.user.services.polkit-mate-authentication-agent-1 = {
    description = "polkit-mate-authentication-agent-1";
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
