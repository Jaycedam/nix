{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./network.nix
    ./options.nix
    ./users.nix
    ./virtualization.nix
  ];

  hardware.enableAllFirmware = true;

  # use xkb config for tty, early for luks prompt
  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

  environment = {
    pathsToLink = ["share/thumbnailers"];
    # fix for internal keyboards blocking touchpad 'disable-while-typing' action, when using keyd
    etc."libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
      [Serial Keyboards]

      MatchUdevType=keyboard
      MatchName=keyd*keyboard
      AttrKeyboardIntegration=internal
    '';
  };
}
