{ lib, ... }:
{
  userCommands = {
    # https://nix-community.github.io/nixvim/NeovimOptions/userCommands/index.html?highlight=userco#usercommands
    # toggle quickfix list
    ToggleQuickfix = {
      command = lib.nixvim.mkRaw ''
        function()
          local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
            return win.quickfix == 1
          end)
          vim.cmd(is_open and "cclose" or "copen")
        end
      '';
      desc = "Toggle Quickfix List";
      force = true;
    };

    # search and replace
    ReplaceWord = {
      command = lib.nixvim.mkRaw ''
        function()
          local word = vim.fn.expand("<cword>")
          vim.api.nvim_feedkeys(vim.keycode(":%s/" .. word .. "//gc<Left><Left><Left>"), "n", false)
        end
      '';
      desc = "Replace word under cursor";
      force = true;
    };

    # copy file path / selection reference for pasting into AI chats
    CopyRef = {
      command = lib.nixvim.mkRaw ''
        function()
          local path = vim.fn.expand("%:.")
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path)
        end
      '';
      desc = "Copy file path";
      force = true;
    };

  };
}
