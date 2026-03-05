{
  lib,
  pkgs,
  compositor,
  ...
}:
let
  monitorCmds =
    if compositor == "niri" then
      {
        powerOn = "niri msg action power-on-monitors";
        powerOff = "niri msg action power-off-monitors";
      }
    else if compositor == "mango" then
      {
        powerOn = "${pkgs.mangowc}/bin/mmsg -d enable_monitor";
        powerOff = "${pkgs.mangowc}/bin/mmsg -d disable_monitor";
      }
    else if compositor == "hyprland" then
      {
        powerOn = "hyprctl dispatch dpms on";
        powerOff = "hyprctl dispatch dpms off";
      }
    else
      throw "Unsupported compositor: ${compositor}";

  lockCmd = "${pkgs.swaylock}/bin/swaylock";
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = lockCmd;
        before_sleep_cmd = lockCmd;
        after_sleep_cmd = lib.mkMerge [
          monitorCmds.powerOn
        ]; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r"; # monitor backlight restore.
        }

        # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
        {
          timeout = 120;
          on-timeout = "brightnessctl -sd kbd_backlight set 0";
          on-resume = "brightnessctl -rd kbd_backlight";
        }

        {
          timeout = 180;
          on-timeout = lockCmd; # lock screen when timeout has passed
        }

        {
          timeout = 180;
          on-timeout = monitorCmds.powerOff;
          on-resume = "${monitorCmds.powerOn} && brightnessctl -r";
        }

        {
          timeout = 300;
          on-timeout = "systemctl suspend"; # suspend pc
        }
      ];
    };
  };
}
