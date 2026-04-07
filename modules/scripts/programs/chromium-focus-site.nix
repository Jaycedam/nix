{ pkgs, ... }:

let
  brave = "${pkgs.brave}/bin/brave";
in

pkgs.writeShellScriptBin "chromium-focus-site" ''
  url="''${1:?Usage: chromium-focus-site <url>}"
  ${brave} --focus="$url/*" "$url"
''
