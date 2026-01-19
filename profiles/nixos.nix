{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  compositor ? "niri",
  ...
}:

let
  # Build conditional module lists using attrset lookup
  compositorModules =
    {
      niri = [ ../modules/nixos/compositors/niri.nix ];
      hyprland = [ ../modules/nixos/compositors/hyprland.nix ];
    }
    .${compositor} or (throw "Invalid compositor: ${compositor}");

  homeCompositorModules =
    {
      niri = [ ../home/niri/default.nix ];
      hyprland = [ ../home/hyprland.nix ];
    }
    .${compositor} or (throw "Invalid compositor: ${compositor}");
in
[
  # modules
  ../modules/shared/default.nix
  ../modules/nixos/default.nix
]
++ compositorModules
++ [
  # home manager
  home-manager.nixosModules.home-manager
  {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit user nixvim compositor;
      };
      users.${user} = {
        imports = [
          ../modules/shared/home.nix
          ../modules/nixos/home.nix
        ]
        ++ homeCompositorModules;
      };
    };
  }
]
