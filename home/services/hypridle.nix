{ pkgs, ... }:
let
  monitorOn = "niri msg action power-on-monitors";
  monitorOff = "niri msg action power-off-monitors";
  lockCmd = "${pkgs.swaylock}/bin/swaylock";
in
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = lockCmd;
        before_sleep_cmd = lockCmd;
        after_sleep_cmd = monitorOn;
      };

      listener = [
        {
          timeout = 120;
          on-timeout = monitorOff;
          on-resume = monitorOn;
        }
        {
          timeout = 120;
          on-timeout = "brightnessctl -sd kbd_backlight set 0";
          on-resume = "brightnessctl -rd kbd_backlight";
        }
        {
          timeout = 180;
          on-timeout = lockCmd;
        }
        {
          timeout = 240;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
