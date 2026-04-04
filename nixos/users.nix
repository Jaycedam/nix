{ user, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "video"
      "networkmanager"
      "wheel"
      "i2c" # allow ddcutil control
      "podman"
      "libvirtd"
      "kvm"
    ];
    # user pkgs, not useful since I use home-manager
    # packages = with pkgs; [ ];
  };
}
