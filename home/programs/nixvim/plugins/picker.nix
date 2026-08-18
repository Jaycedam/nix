let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  mkPluginKeymap = (import ../lib/binds.nix).mkPluginKeymap;
in {
  plugins = {
    mini-extra.enable = true;
    mini-pick = {
      enable = true;
      settings = {
        mappings = {
          choose_marked = "<C-q>";
        };
        window = {
          config = {
            __raw = "function() return { width = vim.o.columns } end";
          };
        };
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>gb" "<cmd>Pick git_branches<cr>" {desc = "Git branches";})
    (mkKeymap "n" "<leader>gc" "<cmd>Pick git_commits<cr>" {desc = "Git commits";})
    (mkKeymap "n" "<leader>fb" "<cmd>Pick buffers<cr>" {desc = "Find buffers";})
    (mkKeymap "n" "<leader>ff" "<cmd>Pick files<cr>" {desc = "Find files";})
    (mkKeymap "n" "<leader>fp" "<cmd>Projects<cr>" {desc = "Find files";})
    (mkKeymap "n" "<leader>fg" "<cmd>Pick grep<cr>" {desc = "Grep";})
    (mkKeymap "n" "<leader>/" "<cmd>Pick grep_live<cr>" {desc = "Grep project";})
    (mkKeymap "n" "<leader>fk" "<cmd>Pick keymaps<cr>" {desc = "Find keymaps";})
    (mkKeymap "n" "<leader>fh" "<cmd>Pick help<cr>" {desc = "Find help";})
    (mkKeymap "n" "<leader><leader>" "<cmd>Pick resume<cr>" {desc = "Resume";})
    (mkKeymap "n" "<leader>fo" "<cmd>Pick oldfiles<cr>" {desc = "Old files";})
    (mkPluginKeymap "n" "<leader>fr" ["mini.extra" "pickers.lsp({ scope = 'references' })"] {desc = "Find references (LSP)";})
    (mkPluginKeymap "n" "<leader>fi" ["mini.extra" "pickers.lsp({ scope = 'implementation' })"] {desc = "Find implementations (LSP)";})
    (mkPluginKeymap "n" "<leader>ft" ["mini.extra" "pickers.lsp({ scope = 'type_definition' })"] {desc = "Type definition";})
    (mkPluginKeymap "n" "<leader>fD" ["mini.extra" "pickers.diagnostic({ scope = 'all' })"] {desc = "Find diagnostics on workspace (LSP)";})
    (mkPluginKeymap "n" "<leader>fd" ["mini.extra" "pickers.diagnostic({ scope = 'current' })"] {desc = "Find diagnostics on current buffer (LSP)";})
    (mkPluginKeymap "n" "<leader>fs" ["mini.extra" "pickers.lsp({ scope = 'document_symbol' })"] {desc = "Find document symbols (LSP)";})
    (mkPluginKeymap "n" "<leader>fS" ["mini.extra" "pickers.lsp({ scope = 'workspace_symbol' })"] {desc = "Find workspace symbols (LSP)";})
    (mkKeymap "n" "<leader>fm" "<cmd>Pick marks<cr>" {desc = "Find marks";})
    (mkKeymap "n" "<leader>vs" "<cmd>Pick spellsuggest<cr>" {desc = "Spell suggestions";})
    (mkKeymap "n" "<leader>fa" "<cmd>lua vim.lsp.buf.code_action()<cr>" {desc = "Code actions";})
  ];
}
