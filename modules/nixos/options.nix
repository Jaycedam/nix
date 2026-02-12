_: {
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
        "@admin"
      ];
    };

    # Automatic garbage collection (generations)
    gc.automatic = true;
    optimise.automatic = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Required for ddcutil to control ext monitor brightness
  hardware.i2c.enable = true;
}
