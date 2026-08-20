{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dmenu-nvim";
  text = "dmenu-projects nvim";
}
