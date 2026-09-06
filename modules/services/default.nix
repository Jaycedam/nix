{
  lib,
  desktop,
  user,
  ...
}: {
  imports =
    [
      ./dns.nix
      ./polkit.nix
      ./keyboard-remaps.nix
    ]
    ++ lib.optional desktop ./homelab.nix;

  services = {
    playerctld.enable = true;
    userdbd.enable = lib.mkDefault false; # avoids systemd's age verification change
    gvfs.enable = true; # Mount, trash, and other functionalities
    udisks2.enable = true; # this is necessary for udiskie to work
    hardware.openrgb.enable = true;
    tumbler.enable = true; # Thumbnail support for images

    displayManager = {
      ly.enable = true;
      defaultSession = "niri";
      autoLogin = {
        enable = true;
        user = user;
      };
    };

    # run as the real user so it can read/write home dirs.
    syncthing = {
      enable = true;
      user = user;
      group = "users";
      dataDir = "/home/${user}";
      guiAddress = "0.0.0.0:8384";
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

    sunshine = lib.mkIf desktop {
      enable = true;
      openFirewall = true;
      capSysAdmin = true; # KMS/DRM capture, no portal needed
    };
  };
}
