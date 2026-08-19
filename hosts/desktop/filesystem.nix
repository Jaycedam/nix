{user, ...}: {
  # mounts
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/208fa710-4554-4c04-9b2a-a7dd49cc4181";
    fsType = "ext4";
    options = [
      "noatime"
      "discard"
    ];
  };

  # ensure the mountpoint is owned by the user
  systemd.tmpfiles.settings."10-ssd" = {
    "/mnt/ssd".d = {
      user = "${user}";
      group = "users";
      mode = "0755";
    };
  };

  # file sharing
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "map to guest" = "bad user";
        "server string" = "desktop";
      };
      ssd = {
        path = "/mnt/ssd";
        "guest ok" = true;
        writable = true;
      };
      games = {
        path = "/home/${user}/Games";
        "guest ok" = true;
        writable = true;
      };
    };
  };
}
