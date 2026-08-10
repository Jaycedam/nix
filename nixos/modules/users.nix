{
  user,
  pkgs,
  ...
}: {
  users.users.${user} = {
    isNormalUser = true;
    shell = pkgs.fish; # todo: use default shell, use fish on each pkg conf

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
