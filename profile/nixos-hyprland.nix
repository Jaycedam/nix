{
  nixpkgs,
  home-manager,
  stylix,
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
    home-manager.users.jay = {
      imports = [
        ../modules/shared/home.nix
        ../modules/nixos/home.nix

        # Hyprland config
        ../home/hyprland.nix
        ../home/waybar.nix
        ../home/hyprlock.nix
        ../home/hypridle.nix
      ];
    };
  }
]

