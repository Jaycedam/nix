_: {
  imports = [
    ./mako.nix
    ./polkit.nix
    ./hypridle.nix
  ];

  services = {
    wpaperd.enable = true;
    udiskie.enable = true;
    playerctld.enable = true;
    syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
      tray.enable = true;
    };
  };

}
