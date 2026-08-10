{
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./overlays.nix
    ./hardware-configuration.nix
    ../../nixos
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;
  zramSwap.enable = true;
  networking.hostName = "asahi";
  system.stateVersion = "25.05";

  hardware = {
    asahi.enable = true;
    bluetooth.enable = true;
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];
}
