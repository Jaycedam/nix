{ pkgs, ... }:

pkgs.writeShellScriptBin "fix-audio" ''
  systemctl --user restart pipewire wireplumber
''
