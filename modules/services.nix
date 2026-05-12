{
  lib,
  pkgs,
  desktop,
  ...
}:
{
  services = {
    userdbd.enable = lib.mkDefault false; # avoids systemd's age verification change
    # udiskie.enable = true;
    # polkit-gnome.enable = true;
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };

    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };

    udisks2.enable = true; # this is necessary for udiskie to work

    sunshine = lib.mkIf desktop {
      enable = true;
      openFirewall = true;
    };
  };

  # low battery notification
  systemd.user.services.low-battery-notify = lib.mkIf (!desktop) {
    description = "Low battery notification";
    path = [
      pkgs.upower
      pkgs.libnotify
      pkgs.gnugrep
      pkgs.gawk
    ];
    serviceConfig.ExecStart = pkgs.writeShellScript "low-battery-notify" ''
      lvl=$(upower -b 2>/dev/null | grep percentage | awk '{print int($2)}')
      state=$(upower -b 2>/dev/null | grep state | awk '{print $2}')
      [ "$state" != discharging ] && exit 0
      [ "$lvl" -le 10 ] && notify-send -u critical "Battery critical" "$lvl%"
      [ "$lvl" -le 20 ] && notify-send -u critical "Battery low" "$lvl%"
      exit 0
    '';
  };
  systemd.user.timers.low-battery-notify = lib.mkIf (!desktop) {
    description = "Check battery every 5min";
    timerConfig.OnCalendar = "*:0/10";
    wantedBy = [ "timers.target" ];
  };

}
