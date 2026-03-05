{
  lib,
  pkgs,
  compositor,
  ...
}:
let
  monitorCmd =
    {
      niri = "${pkgs.niri}/bin/niri msg action power-off-monitors && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.niri}/bin/niri msg action power-on-monitors";
      mango = "${pkgs.mangowc}/bin/mmsg -d disable_monitor && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.mangowc}/bin/mmsg -d enable_monitor";
    }
    .${compositor} or null;
in
{
  # hack to power cycle display, otherwires the backlight control doesn't work
  # TODO: find a better way to do this
  systemd.user.services.asahi-dcp-init = lib.mkIf (monitorCmd != null) {
    Unit = {
      Description = "Reinitialize display for backlight";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${monitorCmd}'";
      RemainAfterExit = false;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
