{ pkgs, ... }: {
  services = {
    udiskie.enable = true;
    syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
      tray.enable = true;
    };
  };

  # https://wiki.nixos.org/wiki/Polkit
  systemd.user.services.polkit-mate-authentication-agent-1 = {
    Unit = {
      Description = "polkit-mate-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
