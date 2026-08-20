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
      ./plugins/picker.nix
      ./plugins/blink.nix
      ./plugins/conform.nix
    ];

    # todo: move this
    extraConfigLua = ''
      require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })
      vim.cmd("packadd nvim.undotree")
      vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })
    '';
  };
}
