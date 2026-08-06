{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dmenu-opencode";
  text = "dmenu-projects opencode";
}
