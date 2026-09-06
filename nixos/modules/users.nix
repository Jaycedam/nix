{ user, ... }: {
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
      "gamemode" # allows gamemode to change power scheme
    ];
  };
}
