{
  config,
  user,
  lib,
  ...
}:
{
  options.systemSettings.homelab = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable the homelab services module";
  };

  config = lib.mkIf config.systemSettings.homelab {
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
      services = {
        # Tdarr node needs write access to /DATA
        # Without this, ProtectSystem=strict blocks all writes outside the node's dataDir
        "tdarr-node-main".serviceConfig = {
          ReadWritePaths = [ "/DATA" ];
        };
        "tdarr-server".serviceConfig = {
          ReadWritePaths = [ "/DATA" ];
        };
        # Fix RW permissions for media group services
        sonarr.serviceConfig.UMask = lib.mkForce "0002";
        radarr.serviceConfig.UMask = lib.mkForce "0002";
        qbittorrent.serviceConfig.UMask = lib.mkForce "0002";
        bazarr.serviceConfig.UMask = lib.mkForce "0002";
        # allow reading from home dir
        navidrome.serviceConfig.ProtectHome = lib.mkForce "tmpfs";
      };
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
      navidrome = {
        enable = true;
        openFirewall = true;
        settings = {
          Address = "0.0.0.0";
          MusicFolder = "/home/${user}/Music";
          DefaultTheme = "Rosé Pine";
          "Subsonic.AppendAlbumVersion" = false;
        };
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
  };
}
