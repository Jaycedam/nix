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
  desktop,
  lib,
  apple-silicon ? null,
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
      desktop
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
        useGlobalPkgs = true;
        useUserPackages = true;
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
