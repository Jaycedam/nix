{
  lib,
  inputs,
  host,
  ...
}:
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./overlays.nix
    ./hardware-configuration.nix
  ];

  hardware = {
    asahi.enable = true;
    bluetooth.enable = true;
  };

  boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  networking.hostName = host;
  system.stateVersion = "25.05";
}
