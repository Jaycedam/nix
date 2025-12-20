{ lib, inputs, ... }:
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
    ./hardware-configuration.nix
  ];
  hardware = {
    asahi = {
      enable = true;
      # use the input's own versions instead of my nixpkgs
      # this avoids asahi pkgs long builds
      pkgs = lib.mkForce (
        import inputs.apple-silicon.inputs.nixpkgs {
          system = "aarch64-linux";
          overlays = [ inputs.apple-silicon.overlays.default ];
        }
      );
    };
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
