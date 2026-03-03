{ mangowc, ... }:
{
  imports = [
    mangowc.nixosModules.mango
  ];

  programs.mango.enable = true;
}
