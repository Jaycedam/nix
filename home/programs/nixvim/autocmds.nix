{
  autoGroups = {
    highlight-yank.clear = true;
    reload-config.clear = true;
  };

  autoCmd = [
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "highlight-yank";
      callback.__raw = ''
        function()
          vim.hl.on_yank()
        end
      '';
    }

    # markdown task checkboxes
    {
      event = "FileType";
      pattern = "markdown";
      callback.__raw = ''
        function()
          vim.keymap.set("n", "<leader>tc", function()
            local line = vim.api.nvim_get_current_line()
            if line:match("%[ %]") then
              line = line:gsub("%[ %]", "[x]", 1)
            elseif line:match("%[x%]") then
              line = line:gsub("%[x%]", "[ ]", 1)
            end
            vim.api.nvim_set_current_line(line)
          end, { buffer = true, desc = "Toggle markdown task checkbox" })
        end
      '';
    }
  ];
}
