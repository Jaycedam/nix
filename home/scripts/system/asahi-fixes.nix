{ pkgs, ... }:

pkgs.writeShellScriptBin "asahi-fixes" ''
  [[ "$(uname -n)" != "asahi" ]] && exit 0

  niri msg action power-off-monitors && niri msg action power-on-monitors
''
