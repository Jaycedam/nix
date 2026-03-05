_: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "asahi";
  system.stateVersion = "25.05";
}
