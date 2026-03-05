{ lib, desktop, ... }:
{
  services = {
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
}
