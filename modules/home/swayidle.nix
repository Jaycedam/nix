{
  pkgs,
  compositor,
  nixos,
  ...
}:

let
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  loginctl = "${pkgs.systemd}/bin/loginctl";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  pidof = "${pkgs.procps}/bin/pidof";
  swaylock = if nixos then "${pkgs.swaylock}/bin/swaylock" else "/usr/bin/swaylock";
  mmsg = "${pkgs.mangowc}/bin/mmsg";

  monitorOffCmd =
    {
      niri = "niri msg action power-off-monitors";
      mango = "${mmsg} -d disable_monitor,eDP-1; ${mmsg} -d disable_monitor,HDMI-A-1";
    }
    .${compositor};

  monitorOnCmd =
    {
      niri = "niri msg action power-on-monitors";
      mango = "${mmsg} -d enable_monitor,eDP-1; ${mmsg} -d enable_monitor,HDMI-A-1";
    }
    .${compositor};
in
{
  services.swayidle = {
    enable = true;
    # extraArgs = [ "-d" ]; # debug
    timeouts = [
      {
        timeout = 120;
        command = "${brightnessctl} -s set 10";
        resumeCommand = "${brightnessctl} -r";
      }
      {
        timeout = 120;
        command = "${brightnessctl} -sd kbd_backlight set 0";
        resumeCommand = "${brightnessctl} -rd kbd_backlight";
      }
      {
        timeout = 180;
        command = "${loginctl} lock-session";
      }
      {
        timeout = 180;
        command = monitorOffCmd;
        resumeCommand = "${monitorOnCmd} && ${brightnessctl} -r";
      }
      {
        timeout = 300;
        command = "${systemctl} suspend";
      }
    ];
    events = {
      "before-sleep" = "${loginctl} lock-session";
      "lock" = "${pidof} swaylock || ${swaylock}";
      "after-resume" = monitorOnCmd;
    };
  };
}
