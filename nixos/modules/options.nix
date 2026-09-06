{
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "America/Santiago";
  hardware.i2c.enable = true; # ddcutil req
  security.pam.services.swaylock = { };

  nix.settings = {
    auto-optimise-store = true;
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
}
