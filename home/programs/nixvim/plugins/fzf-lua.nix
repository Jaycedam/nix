let
  mkRawKeymap = (import ../lib/binds.nix).mkRawKeymap;
in
{
  plugins.fzf-lua = {
    enable = true;
    settings = {
      ui_select = { };

      winopts = {
        backdrop = 100;
        border = "single";
        preview.border = "single";
      };

      hls = {
        normal = "Normal";
        border = "Normal";
        preview_normal = "Normal";
        preview_border = "Normal";
      };

      fzf_colors = {
        __unkeyed-1 = true; # inherit from nvim theme
        bg = "-1";
        gutter = "-1";
      };

      actions.files = {
        __unkeyed-1 = true; # inherit default actions (enter, ctrl-s, alt-q, ...)
        "ctrl-q" = {
          __raw = "require('fzf-lua').actions.file_sel_to_qf";
        };
      };

      keymap = {
        fzf = {
          __unkeyed-1 = true;
          "ctrl-d" = "preview-page-down";
          "ctrl-u" = "preview-page-up";
          "ctrl-a" = "select-all";
        };

        builtin = {
          __unkeyed-1 = true;
          "<C-d>" = "preview-page-down";
          "<C-u>" = "preview-page-up";
        };
      };
    };
  };

  keymaps = [
    # https://nix-community.github.io/nixvim/keymaps/index.html
    # buffers and files
    (mkRawKeymap "n" "<leader>fb" "function() require('fzf-lua').buffers() end" {
      desc = "Find buffers";
    })
    (mkRawKeymap "n" "<leader>ff" "function() require('fzf-lua').files() end" { desc = "Find files"; })
    # search
    (mkRawKeymap "n" "<leader>/" "function() require('fzf-lua').live_grep_native() end" {
      desc = "Grep project";
    })
    (mkRawKeymap "v" "<leader>/" "function() require('fzf-lua').grep_visual() end" {
      desc = "Find visual selection";
    })
    (mkRawKeymap "n" "<leader>fw" "function() require('fzf-lua').grep_cword() end" {
      desc = "Find word under cursor";
    })
    (mkRawKeymap "n" "<leader>fW" "function() require('fzf-lua').grep_cWORD() end" {
      desc = "Find WORD under cursor";
    })
    (mkRawKeymap "n" "<leader>fz" "function() require('fzf-lua').zoxide() end" {
      desc = "Find zoxide directory";
    })
    (mkRawKeymap "n" "<leader>fk" "function() require('fzf-lua').keymaps() end" {
      desc = "Find keymaps";
    })
    (mkRawKeymap "n" "<leader>fh" "function() require('fzf-lua').helptags() end" {
      desc = "Find help";
    })
    # LSP keymaps
    (mkRawKeymap "n" "<leader>fr" "function() require('fzf-lua').lsp_references() end" {
      desc = "Find references (LSP)";
    })
    (mkRawKeymap "n" "<leader>fi" "function() require('fzf-lua').lsp_implementations() end" {
      desc = "Find implementations (LSP)";
    })
    (mkRawKeymap "n" "<leader>fD" "function() require('fzf-lua').diagnostics_workspace() end" {
      desc = "Find diagnostics on workspace (LSP)";
    })
    (mkRawKeymap "n" "<leader>fd" "function() require('fzf-lua').diagnostics_document() end" {
      desc = "Find diagnostics on current buffer (LSP)";
    })
    (mkRawKeymap "n" "<leader>fs" "function() require('fzf-lua').lsp_document_symbols() end" {
      desc = "Find document symbols (LSP)";
    })
    (mkRawKeymap "n" "<leader>fS" "function() require('fzf-lua').lsp_workspace_symbols() end" {
      desc = "Find workspace symbols (LSP)";
    })
    (mkRawKeymap "n" "<leader>fa" "function() require('fzf-lua').lsp_code_actions() end" {
      desc = "Code actions";
    })
    # Neovim
    (mkRawKeymap "n" "<leader>fm" "function() require('fzf-lua').marks() end" { desc = "Find marks"; })
  ];
}
