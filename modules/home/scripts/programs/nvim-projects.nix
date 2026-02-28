{ pkgs, ... }:

pkgs.writeShellScriptBin "nvim-projects" ''
  nvim -c "lua Snacks.picker.projects()"
''
