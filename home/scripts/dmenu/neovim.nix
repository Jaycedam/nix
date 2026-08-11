{pkgs, ...}:
pkgs.writeShellApplication {
  name = "neovim";
  text = "nvim -c FindProject";
}
