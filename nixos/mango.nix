{ inputs, ... }:
{
  imports = [
    inputs.mangowc.nixosModules.mango
  ];

  programs.mango.enable = true;
}
