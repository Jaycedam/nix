{ pkgs, ... }:

pkgs.writeShellScriptBin "niri-launch-or-focus-tui" ''
  CMD="$1"

  if [[ -z "$CMD" ]]; then
      echo "Usage: niri-launch-or-focus-tui <command>"
      exit 1
  fi

  niri-launch-or-focus "kitty --class $CMD $CMD" --id "$CMD"
''
