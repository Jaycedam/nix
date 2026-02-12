{ pkgs, ... }:
# https://wiki.nixos.org/wiki/Virt-manager
# https://wiki.nixos.org/wiki/Podman
{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ]; # shared folders
    };
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      autoPrune.enable = true;
    };
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    # libvirt networking
    dnsmasq
  ];
}
