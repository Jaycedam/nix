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

    colorschemes.base16.enable = true;

    extraConfigLua = ''
      local function source_matugen()
        local matugen_path = vim.fn.expand("~/.config/nvim/generated.lua")
        local file, err = io.open(matugen_path, "r")
        if err ~= nil then
          vim.cmd('colorscheme base16-catppuccin-mocha')
          vim.print("A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!")
        else
          dofile(matugen_path)
          io.close(file)
        end
      end

      source_matugen()

      vim.api.nvim_create_autocmd("Signal", {
        pattern = "SIGUSR1",
        callback = function()
          source_matugen()
          require('lualine').setup({
            options = {
              theme = "base16",
            }
          })
        end,
      })
    '';

    imports = [
      # plugins and their keymaps
      ./plugins/default.nix
      ./plugins/conform.nix
      ./plugins/lint.nix
      ./plugins/flash.nix
      ./plugins/snacks.nix
      ./plugins/blink.nix
      ./plugins/lualine.nix
      ./plugins/noice.nix
      ./plugins/lsp.nix

      # general keymaps
      ./keymaps.nix
      ./opts.nix
    ];
  };
}
