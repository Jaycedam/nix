{ nixvim, pkgs, ... }:

{
  imports = [
    # main nixvim module
    nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };
    plugins = import ./plugins.nix { inherit nixvim pkgs; };
    keymaps = import ./keymaps.nix;
    opts = import ./opts.nix;
  };
}