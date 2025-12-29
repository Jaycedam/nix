{
  ...
}:
{
  # home-manager configuration
  home.stateVersion = "25.11";

  # large configs go to separate files
  imports = [
    ../../home/aerospace.nix
  ];

  jankyborders = {
    enable = true;
  };

}
