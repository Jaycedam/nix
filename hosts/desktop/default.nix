{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./filesystem.nix
    ../../nixos
  ];

  hardware.amdgpu.initrd.enable = true; # fixes lowres on boot
  boot.kernelPackages = pkgs.linuxPackages_latest;
  zramSwap.enable = true;
  networking.hostName = "desktop";
  system.stateVersion = "25.11";

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
