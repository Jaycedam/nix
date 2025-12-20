{ pkgs, ... }:

pkgs.writeShellScriptBin "set-wallpaper" ''
  path="$(readlink -f "''${1:?Usage: $0 <image-path>}")"

  if ! file --mime-type "$path" | grep -q image/; then
      notify-send "set-wallpaper" "$(basename "$path") is not a valid image"
      exit 1
  fi

  ${pkgs.wpaperd}/bin/wpaperctl set "$path"
''
