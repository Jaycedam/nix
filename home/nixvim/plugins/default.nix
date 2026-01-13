{ ... }:
{
  plugins = {
    supermaven.enable = true;
    which-key.enable = true;
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
  };
}
