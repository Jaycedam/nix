{
  nixpkgs,
  home-manager,
  stylix,
  user,
  ...
}:

[
  # modules
  ../modules/shared/default.nix
  ../modules/nixos/default.nix

  # hyprland
  ../modules/nixos/hyprland.nix

  # base16 global themes
  stylix.nixosModules.stylix

  # home manager
  home-manager.nixosModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
    home-manager.extraSpecialArgs = { inherit user; };
    home-manager.users.${user} = {
      imports = [
        ../modules/shared/home.nix
        ../modules/nixos/home.nix

        # hyprland and utils config
        ../home/hyprland.nix
        ../home/dms-shell/default.nix
      ];
    };
  }
]
