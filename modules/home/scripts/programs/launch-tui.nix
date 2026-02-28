{ pkgs, ... }:

let
  kitty = "${pkgs.kitty}/bin/kitty";
in

pkgs.writeShellScriptBin "launch-tui" ''
  app="''${1:?Usage: launch-tui <app>} [args]"
  shift
  echo "Running: ${kitty} -1 --class $app $app $*"
  ${kitty} -1 --class $app $app $*
''
