{ user, ... }:
{
  # Automatic garbage collection (generations)
  nix = {
    gc.automatic = true;
    optimise.automatic = true;
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
