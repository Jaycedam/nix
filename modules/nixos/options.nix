{
  pkgs,
  user,
  ...
}:
{
  # Automatic garbage collection (generations)
  nix = {
    gc.automatic = true;
    optimise.automatic = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c" # allow ddcutil control
    ];
    # packages = with pkgs; [ ];
  };

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Required for ddcutil to control ext monitor brightness
  hardware.i2c.enable = true;
}
