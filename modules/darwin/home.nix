{
  pkgs,
  ...
}:
{
  # home-manager configuration
  home.stateVersion = "25.11";

  # large configs go to separate files
  imports = [
    ../../home/aerospace.nix
  ];

  programs = {
    jankyborders = {
      enable = true;
    };
    ghostty = {
      # just in case, it's enabled on shared module
      enable = true;
      package = pkgs.ghostty-bin;
    };
  };

}
