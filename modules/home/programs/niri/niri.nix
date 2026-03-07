{
  config,
  pkgs,
  ...
}:

{
  home = {
    file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
  };

  # workaraound for Apple backlight not working on boot
  systemd.user.services.fix-apple-backlight = {
    Unit = {
      Description = "Power cycle display to fix Apple backlight on boot";
      After = [ "graphical.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'niri msg action power-off-monitors; sleep 1; niri msg action power-on-monitors'";
    };
    Install = {
      WantedBy = [ "graphical.target" ];
    };
  };
}
