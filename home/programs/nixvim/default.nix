{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfigLua = ''
      require('vim._core.ui2').enable()
      vim.cmd("packadd nvim.undotree")
      vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })
    '';
    imports = [
      ./opts.nix
      ./commands.nix
      ./keymaps.nix
      ./autocmds.nix
      ./lsp.nix

      # plugins, misc has small configs
      ./plugins/misc.nix
      ./plugins/fzf-lua.nix
      ./plugins/blink.nix
      ./plugins/conform.nix
    ];
  };
}
