{
  lib,
  pkgs,
  compositor,
  ...
}:

let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  loginctl = "${pkgs.systemd}/bin/loginctl";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  pidof = "${pkgs.procps}/bin/pidof";

  monitorCmds = {
    niri = {
      off = "niri msg action power-off-monitors";
      on = "niri msg action power-on-monitors";
    };
    mango = {
      off = "mmsg -d disable_monitor,eDP-1; mmsg -d disable_monitor,HDMI-A-1";
      on = "mmsg -d enable_monitor,eDP-1; mmsg -d enable_monitor,HDMI-A-1";
    };
  };

  monitorOffCmd = monitorCmds.${compositor}.off or null;
  monitorOnCmd = monitorCmds.${compositor}.on or null;
in
{
  services.swayidle = {
    enable = true;
    extraArgs = [ "-d" ];
    timeouts = [
      {
        timeout = 30;
        command = "${brightnessctl} -s set 10";
        resumeCommand = "${brightnessctl} -r";
      }
      {
        timeout = 30;
        command = "${brightnessctl} -sd kbd_backlight set 0";
        resumeCommand = "${brightnessctl} -rd kbd_backlight";
      }
      {
        timeout = 60;
        command = "${loginctl} lock-session";
      }
    ]
    ++ lib.optionals (monitorOffCmd != null) [
      {
        timeout = 90;
        command = monitorOffCmd;
        resumeCommand = "${monitorOnCmd} && ${brightnessctl} -r";
      }
    ]
    ++ [
      {
        timeout = 120;
        command = "${systemctl} suspend";
      }
    ];
    events = {
      "before-sleep" = "${loginctl} lock-session";
      "lock" = "${pidof} swaylock || swaylock";
    }
    // lib.optionalAttrs (monitorOnCmd != null) {
      "after-resume" = monitorOnCmd;
    };
  };
}
