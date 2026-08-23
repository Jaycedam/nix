{
  imports = [
  ];

  services = {
    udiskie.enable = true;
    playerctld.enable = true;

    syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
      tray.enable = true;
    };
  };
}
