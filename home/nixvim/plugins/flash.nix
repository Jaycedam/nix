{ ... }:
{
  plugins.flash.enable = true;
  keymaps = [
    {
      key = "<leader>w";
      mode = [
        "n"
        "x"
        "o"
      ];
      action = "<cmd>lua require('flash').jump()<CR>";
      options = {
        desc = "Jump to word";
      };
    }
    {
      key = "<leader>W";
      mode = [
        "n"
        "x"
        "o"
      ];
      action = "<cmd>lua require('flash').treesitter()<CR>";
      options = {
        desc = "Jump to treesitter block";
      };
    }
  ];
}
