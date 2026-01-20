{
  nixpkgs,
  home-manager,
  nix-darwin,
  nix-homebrew,
  homebrew-core,
  homebrew-cask,
  user,
  nixvim,
  ...
}:
let
  darwin = true;
in
[
  # modules
  ../modules/shared/default.nix
  ../modules/darwin/default.nix

  # home manager
  home-manager.darwinModules.home-manager
  {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit user nixvim darwin; };
      users.${user} = {
        imports = [
          ../modules/shared/home.nix
          ../modules/darwin/home.nix
        ];
      };
    };
  }

  nix-homebrew.darwinModules.nix-homebrew
  {
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;
      enableRosetta = true;
      inherit user;
      # Optional: Declarative tap management
      taps = {
        "homebrew/homebrew-core" = homebrew-core;
        "homebrew/homebrew-cask" = homebrew-cask;
      };
      # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
      mutableTaps = false;
    };
  }

  # Optional: Align homebrew taps config with nix-homebrew
  (
    { config, ... }:
    {
      homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
    }
  )
]
