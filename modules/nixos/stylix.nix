{
  inputs,
  theme,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../themes/${theme.name}.nix
  ];
}
