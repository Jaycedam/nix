{
  imports = [
    ./conform.nix
    ./lint.nix
    ./flash.nix
    ./snacks.nix
    ./blink.nix
    ./lualine.nix
    ./noice.nix
    ./lsp.nix
  ];

  plugins = {
    supermaven.enable = true;
    render-markdown.enable = true;
    colorizer.enable = true;
    mini-icons.enable = true;
    mini-surround.enable = true;
    mini-pairs.enable = true;
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
    };
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
      };
    };
  };
}
