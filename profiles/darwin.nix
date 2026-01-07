{
  nixpkgs,
  home-manager,
  stylix,
  nix-darwin,
  nix-homebrew,
  homebrew-core,
  homebrew-cask,
  user,
  nixvim,
  zen-browser,
  ...
}:

[
  # modules
  ../modules/shared/default.nix
  ../modules/darwin/default.nix

  # base16 global themes
  stylix.darwinModules.stylix

  # home manager
  home-manager.darwinModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
    home-manager.extraSpecialArgs = { inherit user nixvim zen-browser; };
    home-manager.users.${user} = {
      imports = [
        ../modules/shared/home.nix
        ../modules/darwin/home.nix
      ];
    };
  }

  nix-homebrew.darwinModules.nix-homebrew
  {
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;
      enableRosetta = true;
      user = user;
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
