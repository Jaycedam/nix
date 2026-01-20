{
  config,
  ...
}:
{
  # large configs go to separate files
  imports = [
    ../../home/aerospace.nix
  ];

  services = {
    jankyborders = {
      enable = true;
    };
  };

  # manual kanata config symlink, since we don't have a home-manager module for it
  home.file."${config.xdg.configHome}/kanata/config.kbd".source = ../../home/kanata.kbd;

  home.stateVersion = "25.11";
}
