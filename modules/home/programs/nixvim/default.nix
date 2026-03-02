{ nixvim, ... }:

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

    performance = {
      # compiles lua to bytecode for faster startup
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        luaLib = true;
        nvimRuntime = true;
        plugins = true;

        # combines all plugins into one file for faster startup
        combinePlugins.enable = true;
      };
    };

    globals = {
      mapleader = " ";
    };

    imports = [
      ./plugins
      ./keymaps.nix
      ./opts.nix
    ];
  };
}
