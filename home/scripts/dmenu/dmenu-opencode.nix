{ pkgs, ... }:

pkgs.writeShellScriptBin "dmenu-opencode" ''
  dmenu-projects opencode
''
