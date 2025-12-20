{ pkgs, ... }:

pkgs.writeShellScriptBin "neovim" ''
  nvim -c "lua _G.fzf_projects()"
''
