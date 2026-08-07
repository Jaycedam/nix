let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  fzf = action: {
    __raw = "function() require('fzf-lua').${action}() end";
  };
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
    (mkKeymap "n" "<leader>fb" (fzf "buffers") { desc = "Find buffers"; })
    (mkKeymap "n" "<leader>ff" (fzf "files") { desc = "Find files"; })
    # search
    (mkKeymap "n" "<leader>/" (fzf "live_grep_native") { desc = "Grep project"; })
    (mkKeymap "v" "<leader>/" (fzf "grep_visual") { desc = "Find visual selection"; })
    (mkKeymap "n" "<leader>fw" (fzf "grep_cword") { desc = "Find word under cursor"; })
    (mkKeymap "n" "<leader>fW" (fzf "grep_cWORD") { desc = "Find WORD under cursor"; })
    (mkKeymap "n" "<leader>fz" (fzf "zoxide") { desc = "Find zoxide directory"; })
    (mkKeymap "n" "<leader>fk" (fzf "keymaps") { desc = "Find keymaps"; })
    (mkKeymap "n" "<leader>fh" (fzf "helptags") { desc = "Find help"; })
    # LSP keymaps
    (mkKeymap "n" "<leader>fr" (fzf "lsp_references") { desc = "Find references (LSP)"; })
    (mkKeymap "n" "<leader>fi" (fzf "lsp_implementations") { desc = "Find implementations (LSP)"; })
    (mkKeymap "n" "<leader>fD" (fzf "diagnostics_workspace") {
      desc = "Find diagnostics on workspace (LSP)";
    })
    (mkKeymap "n" "<leader>fd" (fzf "diagnostics_document") {
      desc = "Find diagnostics on current buffer (LSP)";
    })
    (mkKeymap "n" "<leader>fs" (fzf "lsp_document_symbols") { desc = "Find document symbols (LSP)"; })
    (mkKeymap "n" "<leader>fS" (fzf "lsp_workspace_symbols") { desc = "Find workspace symbols (LSP)"; })
    (mkKeymap "n" "<leader>fa" (fzf "lsp_code_actions") { desc = "Code actions"; })
    # Neovim
    (mkKeymap "n" "<leader>fm" (fzf "marks") { desc = "Find marks"; })
  ];
}
