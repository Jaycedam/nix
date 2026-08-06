{
  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      dns = "none"; # we are using dnsproxy for the dns
    };
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    firewall = {
      enable = true;
      trustedInterfaces = ["virbr0"]; # libvirt network
      allowedTCPPorts = [
        53317 # localsend
        8384 # syncthing gui
      ];
      allowedUDPPorts = [
        53317 # localsend
      ];
    };
  };
}
