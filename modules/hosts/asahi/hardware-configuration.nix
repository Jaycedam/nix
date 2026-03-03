{ config, lib, ... }:

{
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partuuid";
    fsType = "vfat";
  };
}
