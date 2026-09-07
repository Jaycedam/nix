{
  autoGroups = {
    highlight-yank.clear = true;
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
  ];
}
