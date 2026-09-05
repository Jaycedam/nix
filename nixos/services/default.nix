{
  lib,
  user,
  ...
}: {
  imports = [
    ./dns.nix
    ./homelab.nix
    ./keyd.nix
  ];

  services = {
    userdbd.enable = lib.mkForce false; # avoids systemd's age verification change
    gvfs.enable = true;
    udisks2.enable = true; # this is necessary for udiskie to work
    hardware.openrgb.enable = true;
    tumbler.enable = true; # thumbnails

    xserver.xkb = {
      layout = "us";
      variant = "colemak_dh_iso";
    };

    displayManager = {
      ly.enable = true;
      defaultSession = "niri";

      autoLogin = {
        enable = true;
        user = user;
      };
    };

    openssh = {
      enable = true;
      startWhenNeeded = true;
    };

    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };
  };
}
