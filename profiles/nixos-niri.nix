{
  nixpkgs,
  home-manager,
  stylix,
  user,
}:

[
  # modules
  ../modules/shared/default.nix
  ../modules/nixos/default.nix

  # niri
  ../modules/nixos/niri.nix

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

        # Hyprland config
        # ../home/hyprland.nix
        ../home/waybar.nix
        ../home/hyprlock.nix
        ../home/hypridle.nix
      ];
    };
  }

]
