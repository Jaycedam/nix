{ pkgs, ... }:

pkgs.writeShellScriptBin "chromium-focus-site" ''
  url="''${1:?Usage: chromium-focus-site <url>}"
  $BRORSER --focus="$url/*" "$url"
''
