let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
in
{
  plugins = {
    mini-extra.enable = true;
    mini-pick = {
      enable = true;
      settings.mappings.choose_marked = "<C-q>";
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>gb" "<cmd>Pick git_branches<cr>" { desc = "Git branches"; })
    (mkKeymap "n" "<leader>gc" "<cmd>Pick git_commits<cr>" { desc = "Git commits"; })
    (mkKeymap "n" "<leader>fb" "<cmd>Pick buffers<cr>" { desc = "Buffers"; })
    (mkKeymap "n" "<leader>ff" "<cmd>Pick files<cr>" { desc = "Files"; })
    (mkKeymap "n" "<leader>fg" "<cmd>Pick grep<cr>" { desc = "Grep"; })
    (mkKeymap "n" "<leader>/" "<cmd>Pick grep_live<cr>" { desc = "Live grep"; })
    (mkKeymap "n" "<leader><leader>" "<cmd>Pick resume<cr>" { desc = "Resume"; })
    # lsp
    (mkKeymap "n" "<leader>fa" "<cmd>lua vim.lsp.buf.code_action()<cr>" { desc = "LSP code actions"; })
    (mkKeymap "n" "<leader>fr" "<cmd>Pick lsp scope=[[references]]<cr>" { desc = "LSP references"; })
    (mkKeymap "n" "<leader>fi" "<cmd>Pick lsp scope=[[implementation]]<cr>" {
      desc = "LSP implementations";
    })
    (mkKeymap "n" "<leader>ft" "<cmd>Pick lsp scope=[[type_definition]]<cr>" {
      desc = "LSP Type definition";
    })
    (mkKeymap "n" "<leader>fD" "<cmd>Pick diagnostic scope=[[all]]<cr>" {
      desc = "LSP workspace diagnostics";
    })
    (mkKeymap "n" "<leader>fd" "<cmd>Pick diagnostic scope=[[current]]<cr>" {
      desc = "LSP diagnostics";
    })
    (mkKeymap "n" "<leader>fs" "<cmd>Pick lsp scope=[[document_symbol]]<cr>" { desc = "LSP symbols"; })
    (mkKeymap "n" "<leader>fS" "<cmd>Pick lsp scope=[[workspace_symbol]]<cr>" {
      desc = "LSP workspace symbols";
    })
    # vim
    (mkKeymap "n" "<leader>vs" "<cmd>Pick spellsuggest<cr>" { desc = "Spell suggestions"; })
    (mkKeymap "n" "<leader>vm" "<cmd>Pick marks<cr>" { desc = "Marks"; })
    (mkKeymap "n" "<leader>vk" "<cmd>Pick keymaps<cr>" { desc = "Keymaps"; })
    (mkKeymap "n" "<leader>vh" "<cmd>Pick help<cr>" { desc = "Help"; })
    (mkKeymap "n" "<leader>vo" "<cmd>Pick oldfiles<cr>" { desc = "Old files"; })
  ];
}
