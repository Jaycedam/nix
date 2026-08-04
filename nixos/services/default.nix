{
  lib,
  desktop,
  user,
  ...
}:
{
  imports = [
    ./dns.nix
    ./keyd.nix
  ]
  ++ lib.optional desktop ./homelab.nix;

  services = {
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
    userdbd.enable = lib.mkDefault false; # avoids systemd's age verification change
    gvfs.enable = true; # needed for nautilus
    udisks2.enable = true; # this is necessary for udiskie to work
    hardware.openrgb.enable = true;
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };
    sunshine = lib.mkIf desktop {
      enable = true;
      openFirewall = true;
      capSysAdmin = true; # KMS/DRM capture, no portal needed
    };
  };
}
