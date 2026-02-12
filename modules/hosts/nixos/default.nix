{ user, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.initrd.luks.devices."luks-9b198792-4f79-44e0-a9d0-d9cdbbaa08fb".device =
    "/dev/disk/by-uuid/9b198792-4f79-44e0-a9d0-d9cdbbaa08fb";

  networking.hostName = "nixos"; # Define your hostname.

  # Host-specific Hyprland monitor config
  home-manager.users.${user}.wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-1,1920x1080@72,auto,1"
  ];

  # other ssd/hdd mounts
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/208fa710-4554-4c04-9b2a-a7dd49cc4181";
    fsType = "ext4";
    options = [
      "noatime"
      "discard"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
