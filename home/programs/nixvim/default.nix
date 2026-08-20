{inputs, ...}: {
  # todo: move import to make nixvim optionally standalone
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.config.allowUnfree = true;

    imports = [
      ./opts.nix
      ./keymaps.nix
      ./autocmds.nix
      ./lsp.nix
      # plugins
      ./plugins/misc.nix # small or no config
      ./plugins/statusline.nix
      ./plugins/picker.nix
      ./plugins/blink.nix
      ./plugins/conform.nix
    ];
  };
}
