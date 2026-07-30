{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "neovim";
  runtimeInputs = with pkgs; [
    neovim
    vimPlugins.fzf-lua
  ];
  text = "nvim -c 'lua _G.fzf_projects()'";
}
