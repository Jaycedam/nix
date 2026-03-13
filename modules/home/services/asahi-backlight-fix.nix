{ pkgs, compositor, ... }:
let
  monitorCmds =
    {
      niri = {
        powerOn = "${pkgs.niri}/bin/niri msg action power-on-monitors";
        powerOff = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      };
      mango = {
        powerOn = "${pkgs.mangowc}/bin/mmsg -d enable_monitor";
        powerOff = "${pkgs.mangowc}/bin/mmsg -d disable_monitor";
      };
    }
    .${compositor};
in
{
  # workaraound for Apple backlight not working on boot
  systemd.user.services.fix-apple-backlight = {
    Unit = {
      Description = "Power cycle display to fix Apple backlight on boot";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "fix-apple-backlight.sh" ''
        export PATH="${pkgs.coreutils}/bin:${pkgs.bash}/bin"
        ${monitorCmds.powerOff}
        sleep 1
        ${monitorCmds.powerOn}
      '';
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
