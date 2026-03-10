{ lib, host, ... }:
{
  imports = [
    ./hypridle.nix
    ./mako.nix
  ]
  ++ lib.optionals (host == "asahi") [
    ./asahi-backlight-fix.nix
  ];

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
    easyeffects.enable = true;
    gnome-keyring.enable = true;
    wpaperd.enable = true;
  };
}
