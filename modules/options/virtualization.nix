{pkgs, ...}:
# https://wiki.nixos.org/wiki/Virt-manager
# https://wiki.nixos.org/wiki/Podman
{
  virtualisation = {
    containers.enable = true;
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd]; # shared folders
    };
    podman = {
      enable = true;
      extraPackages = with pkgs; [podman-compose];
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      autoPrune.enable = true;
    };
  };
}
