{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
  ];

  networking.hostName = host;
  # Load amdgpu in initrd — fixes low resolution in boot screen / Plymouth
  hardware.amdgpu.initrd.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
