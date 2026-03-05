{
  nixpkgs,
  user,
  mangowc,
  nixvim,
  nixos,
  stylix,
  theme,
  compositor,
  home-manager,
  system,
  host,
  apple-silicon ? null,
  lib,
  ...
}:
let
  commonArgs = {
    inherit
      user
      nixvim
      stylix
      nixos
      theme
      compositor
      mangowc
      apple-silicon
      ;
  };
  hostModule = ../modules/hosts/${host};
  appleSiliconModules = lib.optionals (apple-silicon != null) [
    apple-silicon.nixosModules.apple-silicon-support
  ];
in
nixpkgs.lib.nixosSystem {
  specialArgs = commonArgs;
  modules = [
    hostModule
    ../modules/nixos

    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        users.${user} = ../modules/home;
        extraSpecialArgs = commonArgs // {
          inherit system;
        };
      };
    }
  ]
  ++ appleSiliconModules;
}
