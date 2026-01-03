{
  config,
  ...
}:

{
  # manual dms-shell config symlink, since we don't have a home-manager module for it
  home.file."${config.xdg.configHome}/DankMaterialShell/settings.json".source = ./settings.json;
}
