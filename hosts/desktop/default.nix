{ pkgs, lib, user, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Disable scatter/gather display — avoids IOMMU scanout corruption on Raven2/Picasso APUs
    # https://docs.kernel.org/6.8/gpu/amdgpu/module-parameters.html (sg_display)
    kernelParams = lib.mkAfter [ "amdgpu.sg_display=0" ];
    initrd.luks.devices."luks-b87d2a5d-6163-4568-8a83-01361aeb8ee9".device =
      "/dev/disk/by-uuid/b87d2a5d-6163-4568-8a83-01361aeb8ee9";
  };

  # Load amdgpu in initrd — fixes low resolution in boot screen / Plymouth
  hardware.amdgpu.initrd.enable = true;

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
