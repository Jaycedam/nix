_: {
  # Enable networking
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
      trustedInterfaces = [ "virbr0" ]; # libvirt network
      allowedTCPPorts = [
        53317 # localsend
      ];
      allowedUDPPorts = [
        53317 # localsend
      ];
    };
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
      };

      require_dnssec = true;
      require_nolog = true;
      require_nofilter = true;

      server_names = [
        "mullvad-adblock-doh"
        "adguard-dns-doh"
      ];
    };
  };
  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = "dnscrypt-proxy";
}
