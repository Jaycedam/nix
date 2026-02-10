{ user, ... }:
{
  users.groups.media = { };

  systemd.tmpfiles.rules = [
    "d /DATA 0775 ${user} media -"
    "d /DATA/Shows 0775 ${user} media -"
    "d /DATA/Movies 0775 ${user} media -"
    "d /DATA/Downloads 0775 ${user} media -"
  ];

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
    jellyseerr = {
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
  };
}
