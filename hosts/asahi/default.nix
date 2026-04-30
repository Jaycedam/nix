{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;
  # workaraound until https://github.com/NixOS/nixpkgs/issues/513512 lands on unstable
  boot.kernel.sysctl."vm.mmap_rnd_bits" = 31;

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
