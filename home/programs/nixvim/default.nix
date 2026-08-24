{
  inputs,
  config,
  lib,
  ...
}: let
  # stylix themes can define a colorscheme plugin instead of base16
  theme = import (./../stylix/themes + "/${config.userSettings.theme.name}.nix");
in {
  # TODO: move import to make nixvim optionally standalone
  imports = [inputs.nixvim.homeModules.nixvim];

  programs.nixvim =
    {
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
        ./plugins/statusline.nix
        ./plugins/picker.nix
        ./plugins/blink.nix
        ./plugins/conform.nix
      ];
    }
    // lib.optionalAttrs (theme ? nixvim) theme.nixvim;
}
