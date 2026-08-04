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
      auto-optimise-store = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "America/Santiago";
  # Required for ddcutil
  hardware.i2c.enable = true;
  # enable swaylock to access pam
  security.pam.services.swaylock = { };
}
