{ inputs, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.config.allowUnfree = true;

    performance = {
      byteCompileLua.enable = true;
      byteCompileLua.configs = true;
      byteCompileLua.initLua = true;
      byteCompileLua.luaLib = true;
      byteCompileLua.nvimRuntime = true;
      byteCompileLua.plugins = true;
    };

    imports = [
      ./opts.nix
      ./keymaps.nix
      ./autocmds.nix
      ./lsp.nix
      # plugins
      ./plugins/misc.nix # small or no config
      ./plugins/picker.nix
      ./plugins/blink.nix
      ./plugins/conform.nix
    ];
  };
}
