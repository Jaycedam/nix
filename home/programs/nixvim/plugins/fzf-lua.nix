let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  mkPluginKeymap = (import ../lib/binds.nix).mkPluginKeymap;
in {
  plugins.fzf-lua = {
    enable = true;
    profile = "telescope";
    settings = {
      ui_select.__raw = "{}";

      winopts = {
        border = "single";
        preview.border = "single";
      };
    };
  };

  keymaps = [
    # buffers and files
    (mkPluginKeymap "n" "<leader>fb" ["fzf-lua" "buffers"] {desc = "Find buffers";})
    (mkPluginKeymap "n" "<leader>ff" ["fzf-lua" "files"] {desc = "Find files";})
    # search
    (mkPluginKeymap "n" "<leader>/" ["fzf-lua" "live_grep_native"] {desc = "Grep project";})
    (mkPluginKeymap "v" "<leader>/" ["fzf-lua" "grep_visual"] {desc = "Find visual selection";})
    (mkPluginKeymap "n" "<leader>fw" ["fzf-lua" "grep_cword"] {desc = "Find word under cursor";})
    (mkPluginKeymap "n" "<leader>fW" ["fzf-lua" "grep_cWORD"] {desc = "Find WORD under cursor";})
    (mkPluginKeymap "n" "<leader>fz" ["fzf-lua" "zoxide"] {desc = "Find zoxide directory";})
    (mkPluginKeymap "n" "<leader>fk" ["fzf-lua" "keymaps"] {desc = "Find keymaps";})
    (mkPluginKeymap "n" "<leader>fh" ["fzf-lua" "helptags"] {desc = "Find help";})
    # LSP keymaps
    (mkPluginKeymap "n" "<leader>fr" ["fzf-lua" "lsp_references"] {desc = "Find references";})
    (mkPluginKeymap "n" "<leader>fi" ["fzf-lua" "lsp_implementations"] {desc = "Find implementations";})
    (mkPluginKeymap "n" "<leader>fD" ["fzf-lua" "diagnostics_workspace"] {desc = "Find diagnostics on workspace";})
    (mkPluginKeymap "n" "<leader>fd" ["fzf-lua" "diagnostics_document"] {desc = "Find diagnostics on current buffer";})
    (mkPluginKeymap "n" "<leader>fs" ["fzf-lua" "lsp_document_symbols"] {desc = "Find symbols";})
    (mkPluginKeymap "n" "<leader>fS" ["fzf-lua" "lsp_workspace_symbols"] {desc = "Find symbols (workspace)";})
    (mkPluginKeymap "n" "<leader>fa" ["fzf-lua" "lsp_code_actions"] {desc = "Code actions";})
    # Neovim
    (mkPluginKeymap "n" "<leader>fm" ["fzf-lua" "marks"] {desc = "Find marks";})

    (mkKeymap "n" "<leader>fp" "<cmd>FindProject<cr>" {desc = "Find Project (cd)";})
  ];
}
