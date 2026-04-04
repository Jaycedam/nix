_: {
  imports = [
    ./hypridle.nix
    ./mako.nix
  ];

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
    gnome-keyring.enable = true;
    wpaperd.enable = true;
  };
}
