{ lib, inputs, host, ... }:
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./hardware-configuration.nix
  ];

  nixpkgs.overlays = [
    (final: prev: {
      ryubing = prev.ryubing.overrideAttrs (old: {
        makeWrapperArgs = (old.makeWrapperArgs or [ ]) ++ [
          "--set AVALONIA_GLOBAL_SCALE_FACTOR 2"
        ];
      });
    })
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
