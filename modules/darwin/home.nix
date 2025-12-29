{
  pkgs,
  ...
}:
{
  # large configs go to separate files
  imports = [
    ../../home/aerospace.nix
  ];

  programs = {
    ghostty = {
      # just in case, it's enabled on shared module
      enable = true;
      package = pkgs.ghostty-bin; # override for the darwin only version
    };
  };
  services = {
    jankyborders = {
      enable = true;
    };
  };

  # home-manager configuration
  home.stateVersion = "25.11";
}
