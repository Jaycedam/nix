{
  config,
  pkgs,
  lib,
  ...
}:
{
  home = {
    file."${config.xdg.configHome}/niri/config.kdl".source = pkgs.writeText "config.kdl" (
      lib.replaceStrings
        [
          "__ACTIVE_COLOR__"
          "__INACTIVE_COLOR__"
        ]
        [
          config.lib.stylix.colors.base0D
          config.lib.stylix.colors.base03
        ]
        (builtins.readFile ./niri.kdl)
    );
  };

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
        ${pkgs.niri}/bin/niri msg output eDP-1 off
        sleep 1
        ${pkgs.niri}/bin/niri msg output eDP-1 on
      '';
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
