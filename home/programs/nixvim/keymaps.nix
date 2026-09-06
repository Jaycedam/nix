let
  mkKeymap = (import ./lib/binds.nix).mkKeymap;
  mkRawKeymap = (import ./lib/binds.nix).mkRawKeymap;
in
{
  globals.mapleader = " ";

  extraConfigLua = ''
    vim.cmd("packadd nvim.undotree")
    vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })
  '';

  keymaps = [
    # https://nix-community.github.io/nixvim/keymaps/index.html
    # global keymaps
    (mkKeymap "t" "<esc>" ''<C-\><C-n>'' { desc = "Exit terminal mode"; })
    (mkKeymap "n" "<Esc>" "<cmd>nohlsearch<CR>" { desc = "Clear search highlights"; })
    (mkKeymap "n" "<leader>l" "<cmd>buffer #<cr>" { desc = "Last buffer"; })
    (mkKeymap "n" "<C-c>" "<cmd>bwipeout<cr>" { desc = "Close current buffer"; })

    # clipboard and registers
    (mkKeymap [ "n" "v" ] "<leader>y" ''"+y'' { desc = "Yank to system clipboard"; })

    # tab management
    (mkKeymap "n" "<leader>vt" "<cmd>tabnew<cr>" { desc = "New tab"; })

    # navigation
    (mkKeymap "n" "<C-h>" "<C-w>h" { desc = "Move to left window"; })
    (mkKeymap "n" "<C-j>" "<C-w>j" { desc = "Move to lower window"; })
    (mkKeymap "n" "<C-k>" "<C-w>k" { desc = "Move to upper window"; })
    (mkKeymap "n" "<C-l>" "<C-w>l" { desc = "Move to right window"; })
    (mkKeymap "n" "<C-left>" "<C-w>h" { desc = "Move to left window"; })
    (mkKeymap "n" "<C-down>" "<C-w>j" { desc = "Move to lower window"; })
    (mkKeymap "n" "<C-up>" "<C-w>k" { desc = "Move to upper window"; })
    (mkKeymap "n" "<C-right>" "<C-w>l" { desc = "Move to right window"; })

    # toggle quickfix list
    (mkRawKeymap "n" "<leader>q" ''
      function()
        local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
          return win.quickfix == 1
        end)
        vim.cmd(is_open and "cclose" or "copen")
      end
    '' { desc = "Toggle Quickfix List"; })

    # search and replace
    (mkRawKeymap "n" "<leader>vs" ''
      function()
        local word = vim.fn.expand("<cword>")
        vim.api.nvim_feedkeys(vim.keycode(":%s/" .. word .. "//gc<Left><Left><Left>"), "n", false)
      end
    '' { desc = "Replace word under cursor"; })

    # copy file path / selection reference
    (mkRawKeymap "n" "<leader>vp" ''
      function()
        local path = vim.fn.expand("%:.")
        vim.fn.setreg("+", path)
        vim.notify("Copied: " .. path)
      end
    '' { desc = "Copy file path"; })

    (mkKeymap "n" "<leader>vc" "<cmd>mksession<cr>" { desc = "Create session"; })
  ];
}
