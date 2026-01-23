{
  lib,
  pkgs,
  user,
  ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    allow32Bit = true;
  };

  # Configure nix for the user
  nix = {
    package = pkgs.nix;
    settings.trusted-users = [ user ];
  };
}