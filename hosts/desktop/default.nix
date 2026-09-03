{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
    ../../nixos
    ./bluetooth.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  zramSwap.enable = true;
  networking.hostName = "desktop";
  system.stateVersion = "25.11";

  hardware = {
    amdgpu.initrd.enable = true;
    bluetooth.enable = true;
  };

  # system settings
  systemSettings = {
    homelab = true;
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];
}
