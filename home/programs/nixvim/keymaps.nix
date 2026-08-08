let
  mkKeymap = (import ./lib/binds.nix).mkKeymap;
in
{
  globals.mapleader = " ";
  keymaps = [
    # https://nix-community.github.io/nixvim/keymaps/index.html
    # for plugin keymaps look into each plugin spec

    # global keymaps
    (mkKeymap "t" "<esc>" ''<C-\><C-n>'' { desc = "Exit terminal mode"; })
    (mkKeymap "n" "<Esc>" "<cmd>nohlsearch<CR>" { desc = "Clear search highlights"; })
    (mkKeymap "n" "<leader>l" ":buffer #<CR>" {
      silent = true;
      desc = "Last buffer";
    })
    (mkKeymap "n" "<C-c>" ":bwipeout<CR>" {
      silent = true;
      desc = "Close current buffer";
    })

    # clipboard and registers
    (mkKeymap [ "n" "v" ] "<leader>y" ''"+y'' { desc = "Yank to system clipboard"; })

    # tab management
    (mkKeymap "n" "<leader>vt" ":tabnew<CR>" {
      silent = true;
      desc = "New tab";
    })

    # window navigation
    (mkKeymap "n" "<C-h>" "<C-w>h" { desc = "Move to left window"; })
    (mkKeymap "n" "<C-j>" "<C-w>j" { desc = "Move to lower window"; })
    (mkKeymap "n" "<C-k>" "<C-w>k" { desc = "Move to upper window"; })
    (mkKeymap "n" "<C-l>" "<C-w>l" { desc = "Move to right window"; })
    (mkKeymap "n" "<C-left>" "<C-w>h" { desc = "Move to left window"; })
    (mkKeymap "n" "<C-down>" "<C-w>j" { desc = "Move to lower window"; })
    (mkKeymap "n" "<C-up>" "<C-w>k" { desc = "Move to upper window"; })
    (mkKeymap "n" "<C-right>" "<C-w>l" { desc = "Move to right window"; })

    # toggle quickfix list
    (mkKeymap "n" "<leader>q" "<cmd>ToggleQuickfix<CR>" { desc = "Toggle Quickfix List"; })

    # search and replace
    (mkKeymap "n" "<leader>s" "<cmd>ReplaceWord<CR>" { desc = "Replace word under cursor"; })
    (mkKeymap "v" "<leader>s" "<cmd>ReplaceVisualSelection<CR>" { desc = "Replace visual selection"; })

    # copy file path / selection reference
    (mkKeymap "n" "<leader>c" "<cmd>CopyRef<CR>" { desc = "Copy file path"; })
  ];
}
