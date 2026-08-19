{pkgs, ...}: {
  # https://wiki.nixos.org/wiki/Polkit
  systemd.user.services.polkit-mate-authentication-agent-1 = {
    description = "polkit-mate-authentication-agent-1";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
