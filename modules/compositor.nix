{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    polkit_gnome
  ];

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
