{ nixvim, pkgs, ... }:

{
  imports = [
    # main nixvim module
    nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };

    imports = [
      # plugins and their keymaps
      ./plugins/default.nix
      ./plugins/conform.nix
      ./plugins/lint.nix
      ./plugins/flash.nix
      ./plugins/snacks.nix
      (import ./plugins/lsp.nix { inherit pkgs; })

      # general keymaps
      ./keymaps.nix
      ./opts.nix
    ];
  };
}
