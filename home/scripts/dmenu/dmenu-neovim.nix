{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "dmenu-neovim";
  text = "dmenu-projects nvim --id neovim";
}
