{ ... }:
{
  plugins = {
    blink-cmp.enable = true;
    supermaven.enable = true;
    which-key.enable = true;
    render-markdown.enable = true;
    colorizer.enable = true;
    mini-icons.enable = true;
    mini-statusline.enable = true;
    mini-surround.enable = true;
    mini-pairs.enable = true;

    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
