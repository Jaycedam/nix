{ user, lib, ... }:
{
  users.groups.media = { };
  systemd = {
    tmpfiles.rules = [
      "d /DATA 2775 ${user} media -"
      "d /DATA/Cache 2775 ${user} media -"
      "d /DATA/Shows 2775 ${user} media -"
      "d /DATA/Movies 2775 ${user} media -"
      "d /DATA/Peliculas 2775 ${user} media -"
      "d /DATA/Downloads 2775 ${user} media -"
    ];

    # Tdarr node needs write access to /DATA
    # Without this, ProtectSystem=strict blocks all writes outside the node's dataDir
    services."tdarr-node-main".serviceConfig = {
      ReadWritePaths = [ "/DATA" ];
    };

    # Sonarr and Radarr hardcode UMask=0022, creating files as 644 (no group write)
    # Override to 0002 so media group can write (needed by Tdarr's replaceOriginalFile)
    services.sonarr.serviceConfig.UMask = lib.mkForce "0002";
    services.radarr.serviceConfig.UMask = lib.mkForce "0002";
  };

  services = {
    radarr = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    sonarr = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    flaresolverr = {
      enable = true;
      openFirewall = true;
    };
    bazarr = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    seerr = {
      enable = true;
      openFirewall = true;
    };
    qbittorrent = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    plex = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    jellyfin = {
      enable = true;
      openFirewall = true;
      group = "media";
    };
    tdarr = {
      enable = true;
      group = "media";
      server.openFirewall = true;
      nodes.main = {
        workers = {
          transcodeCPU = 2;
          healthcheckCPU = 1;
        };
      };
    };
  };
}
