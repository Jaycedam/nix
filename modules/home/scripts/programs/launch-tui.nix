{ pkgs, ... }:

let
  kitty = "${pkgs.kitty}/bin/kitty";
in

pkgs.writeShellScriptBin "launch-tui" ''
  app="''${1:?Usage: launch-tui <app>}"
  ${kitty} -1 --class "$app" "$app"
''
