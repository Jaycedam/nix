{ user, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "video"
      "networkmanager"
      "wheel"
      "i2c" # allow ddcutil control
      "podman"
      "libvirtd"
      "kvm"
    ];
    # packages = with pkgs; [ ];
  };
}
