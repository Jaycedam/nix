_: {
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;

  networking.hostName = "asahi";
  system.stateVersion = "25.05";
}
