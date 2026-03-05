{
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;

  hardware.bluetooth.enable = true;
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  networking.hostName = "asahi";
  system.stateVersion = "25.05";
}
