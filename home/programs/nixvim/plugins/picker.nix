let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  mkPluginKeymap = (import ../lib/binds.nix).mkPluginKeymap;
in {
  plugins = {
    mini-extra.enable = true;
    mini-pick = {
      enable = true;
      settings = {
        window.config.__raw = "function() return { width = vim.o.columns } end";
        mappings.choose_marked = "<C-q>";
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>gb" "<cmd>Pick git_branches<cr>" {desc = "Git branches";})
    (mkKeymap "n" "<leader>gc" "<cmd>Pick git_commits<cr>" {desc = "Git commits";})
    (mkKeymap "n" "<leader>fb" "<cmd>Pick buffers<cr>" {desc = "Buffers";})
    (mkKeymap "n" "<leader>ff" "<cmd>Pick files<cr>" {desc = "Files";})
    (mkKeymap "n" "<leader>fg" "<cmd>Pick grep<cr>" {desc = "Grep";})
    (mkKeymap "n" "<leader>/" "<cmd>Pick grep_live<cr>" {desc = "Live grep";})
    (mkKeymap "n" "<leader><leader>" "<cmd>Pick resume<cr>" {desc = "Resume";})
    # lsp
    (mkKeymap "n" "<leader>fa" "<cmd>lua vim.lsp.buf.code_action()<cr>" {desc = "LSP code actions";})
    (mkPluginKeymap "n" "<leader>fr" ["mini.extra" "pickers.lsp({ scope = 'references' })"] {desc = "LSP references";})
    (mkPluginKeymap "n" "<leader>fi" ["mini.extra" "pickers.lsp({ scope = 'implementation' })"] {desc = "LSP implementations";})
    (mkPluginKeymap "n" "<leader>ft" ["mini.extra" "pickers.lsp({ scope = 'type_definition' })"] {desc = "LSP Type definition";})
    (mkPluginKeymap "n" "<leader>fD" ["mini.extra" "pickers.diagnostic({ scope = 'all' })"] {desc = "LSP workspace diagnostics";})
    (mkPluginKeymap "n" "<leader>fd" ["mini.extra" "pickers.diagnostic({ scope = 'current' })"] {desc = "LSP diagnostics";})
    (mkPluginKeymap "n" "<leader>fs" ["mini.extra" "pickers.lsp({ scope = 'document_symbol' })"] {desc = "LSP symbols";})
    (mkPluginKeymap "n" "<leader>fS" ["mini.extra" "pickers.lsp({ scope = 'workspace_symbol' })"] {desc = "LSP workspace symbols";})
    # vim
    (mkKeymap "n" "<leader>vs" "<cmd>Pick spellsuggest<cr>" {desc = "Spell suggestions";})
    (mkKeymap "n" "<leader>vm" "<cmd>Pick marks<cr>" {desc = "Marks";})
    (mkKeymap "n" "<leader>vk" "<cmd>Pick keymaps<cr>" {desc = "Keymaps";})
    (mkKeymap "n" "<leader>vh" "<cmd>Pick help<cr>" {desc = "Help";})
    (mkKeymap "n" "<leader>vo" "<cmd>Pick oldfiles<cr>" {desc = "Old files";})
  ];
}
