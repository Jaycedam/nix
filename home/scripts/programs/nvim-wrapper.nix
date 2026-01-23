{ pkgs, ... }:

pkgs.writeShellScriptBin "nvim-wrapper" ''
  kitty --class nvim-wrapper nvim -c "lua Snacks.picker.projects()"
''
