{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
  ];

  networking.hostName = "desktop"; # Define your hostname.
  # Load amdgpu in initrd — fixes low resolution in boot screen / Plymouth
  hardware.amdgpu.initrd.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Disable scatter/gather display — avoids IOMMU scanout corruption on Raven2/Picasso APUs
    # https://docs.kernel.org/6.8/gpu/amdgpu/module-parameters.html (sg_display)
    kernelParams = lib.mkAfter [ "amdgpu.sg_display=0" ];
  };

  # Swap file on the encrypted root (no separate LUKS volume needed), plus zram.
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  # don't change unless you know what you're doing
  system.stateVersion = "25.11";
}
