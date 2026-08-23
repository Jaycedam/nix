{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # TODO: add activation script that empties temp settings

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      launch_apps_as_systemd_services = true;
    };
  };
}
