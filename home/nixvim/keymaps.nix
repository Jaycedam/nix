{ ... }:
{
  keymaps = [
    {
      action = "<cmd>nohlsearch<CR>";
      mode = "n";
      key = "<Esc>";
      options = {
        silent = true;
        desc = "Clear search highlights";
      };
    }
    {
      key = "<leader>l";
      mode = "n";
      action = ":buffer #<CR>";
      options = {
        silent = true;
        desc = "Go to last buffer";
      };
    }
    {
      mode = "v";
      key = "<leader>y";
      action = ''"+y'';
      options = {
        desc = "Yank to system clipboard";
      };
    }
    {
      key = "<leader>q";
      mode = "n";
      action = {
        __raw = ''
          function()
          local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
                  return win.quickfix == 1
                  end)
                      vim.cmd(is_open and "cclose" or "copen")
                                                        end
        '';
      };
      options = {
        desc = "Toggle Quickfix List";
      };
    }
  ];
}
