{ pkgs, ... }:

pkgs.writeShellScriptBin "launch-or-focus" ''
  usage() {
      echo "Launch or focus windows on niri"
      echo "Usage: $0 <mode> [args...]"
      echo ""
      echo "Modes:"
      echo "  <command>                        Run command directly (default)"
      echo "  --tui <command>                  Launch command in kitty terminal"
      echo "  --webapp <url>                   Launch webapp for URL (needs a Chromium-based browser, default: brave)"
      echo "  --website <url>                  Focus existing tab matching URL or open new tab (needs Chromium --focus support)"
      echo ""
      echo "Options:"
      echo "  --id <app_id>                    App ID for window matching (defaults to command/url)"
      echo "  -h, --help                       Show this help message"
  }

  MODE=""
  ID=""
  CMD_ARGS=()
  WEBAPP_BROWSER="''${WEBAPP_BROWSER:-brave}"

  while [ $# -gt 0 ]; do
      case "$1" in
      -h | --help)
          usage
          exit 0
          ;;
      --id)
          ID="$2"
          shift 2
          ;;
      --tui)
          [ -n "$MODE" ] && { echo "Error: conflicting modes"; usage; exit 1; }
          MODE=tui
          CMD_ARGS=(${pkgs.kitty}/bin/kitty -1 --app-id "$2" "$2")
          [ -z "$ID" ] && ID="$2"
          shift 2
          ;;
      --webapp)
          [ -n "$MODE" ] && { echo "Error: conflicting modes"; usage; exit 1; }
          MODE=webapp
          CMD_ARGS=("$WEBAPP_BROWSER" --app="https://$2")
          [ -z "$ID" ] && ID="$WEBAPP_BROWSER-$2__-Default"
          shift 2
          ;;
      --website)
          [ -n "$MODE" ] && { echo "Error: conflicting modes"; usage; exit 1; }
          MODE=website
          CMD_ARGS=("$WEBAPP_BROWSER" --focus="https://$2/*" "https://$2")
          ID=""
          shift 2
          ;;
      *)
          [ -n "$MODE" ] && { echo "Error: conflicting modes"; usage; exit 1; }
          MODE=default
          CMD_ARGS=("$1")
          shift
          ;;
      esac
  done

  [ -z "$ID" ] && ID="''${CMD_ARGS[0]}"

  if [ "$MODE" != website ]; then
      ID=$(niri msg --json windows | jq -r '.[] | select(.app_id == "'"$ID"'") | .id' | head -1)
  fi

  niri msg action focus-window --id "$ID" && exit 0
  niri msg action spawn -- "''${CMD_ARGS[@]}"
''
