{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./overlays.nix
    ./hardware-configuration.nix
    ../../nixos
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

  networking.hostName = "asahi";
  system.stateVersion = "25.05";
}
