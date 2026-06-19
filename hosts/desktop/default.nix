{ pkgs, user, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.luks.devices."luks-b87d2a5d-6163-4568-8a83-01361aeb8ee9".device =
      "/dev/disk/by-uuid/b87d2a5d-6163-4568-8a83-01361aeb8ee9";
  };

  networking.hostName = "desktop"; # Define your hostname.

  # other ssd/hdd mounts
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/208fa710-4554-4c04-9b2a-a7dd49cc4181";
    fsType = "ext4";
    options = [
      "noatime"
      "discard"
    ];
  };

  system.activationScripts.ssd-owner = {
    deps = [
      "users"
      "groups"
    ];
    text = ''
      chown ${user}:users /mnt/ssd
    '';
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
