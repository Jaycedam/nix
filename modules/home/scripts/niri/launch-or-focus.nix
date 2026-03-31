{ pkgs, ... }:

pkgs.writeShellScriptBin "niri-launch-or-focus" ''
  # Script to launch an app or focus if already open using niri IPC

  # Function to display usage
  usage() {
      echo "Usage: $0 <command> [--id <app_id>] [--tui] [--webapp [--profile <profile>]] [--debug]"
      echo ""
      echo "Arguments:"
      echo "  <command>    The command to run if the app is not already open"
      echo "  --id <app_id> Optional app_id to identify the app (defaults to <command> if not provided)"
      echo ""
      echo "Options:"
      echo "  -h, --help   Show this help message"
      echo "  --tui        Launch in kitty terminal (wraps command with 'kitty --class <id>')"
      echo "  --webapp     Treat <command> as a webapp URL (domain) and launch via Brave"
      echo "  --profile <profile>  Brave profile name for webapp mode (default: Default)"
      echo "  --debug      Enable debug output"
      echo ""
      echo "This script checks if an app with the given app_id is open using niri IPC."
      echo "If open, it focuses the window; otherwise, it spawns the app."
  }

  # Parse arguments
  CMD=""
  ID=""
  DEBUG=0
  TUI=0
  WEBAPP=0
  PROFILE="Default"

  while [[ $# -gt 0 ]]; do
      case $1 in
          -h|--help)
              usage
              exit 0
              ;;
          --debug)
              DEBUG=1
              shift
              ;;
          --tui)
              TUI=1
              shift
              ;;
          --webapp)
              WEBAPP=1
              shift
              ;;
          --profile)
              if [[ -n "$2" && "$2" != -* ]]; then
                  PROFILE="$2"
                  shift 2
              else
                  echo "Error: --profile requires an argument."
                  usage
                  exit 1
              fi
              ;;
          --id)
              if [[ -n "$2" && "$2" != -* ]]; then
                  ID="$2"
                  shift 2
              else
                  echo "Error: --id requires an argument."
                  usage
                  exit 1
              fi
              ;;
          -*)
              echo "Unknown option: $1"
              usage
              exit 1
              ;;
          *)
              if [[ -z "$CMD" ]]; then
                  CMD="$1"
              else
                  echo "Error: Too many arguments. Expected only one command."
                  usage
                  exit 1
              fi
              shift
              ;;
      esac
  done

  # Check if CMD is provided
  if [[ -z "$CMD" ]]; then
      echo "Error: Command is required."
      usage
      exit 1
  fi

  if [[ "$WEBAPP" == "1" ]]; then
      URL="$CMD"
      if [[ -z "$ID" ]]; then
          ID="brave-''${URL}__-''${PROFILE}"
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: Using webapp ID: $ID"; fi
      fi

      if [[ "$DEBUG" == "1" ]]; then
          echo "Debug: Webapp mode enabled"
          echo "Debug: URL: $URL"
          echo "Debug: Profile: $PROFILE"
          echo "Debug: APP_ID: $ID"
      fi

      if [[ "$DEBUG" == "1" ]]; then echo "Debug: Checking for existing window with APP_ID: $ID"; fi

      if niri msg --json windows | jq -e '.[] | select(.app_id == "'"$ID"'")' >/dev/null 2>&1; then
          WINDOW_ID=$(niri msg --json windows | jq '.[] | select(.app_id == "'"$ID"'") | .id')
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: Window found, focusing on ID: $WINDOW_ID"; fi
          niri msg action focus-window --id "$WINDOW_ID"
      else
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: No window found, launching webapp"; fi
          launch-webapp "$URL" "$PROFILE"
      fi
  else
      # If ID not provided, use CMD as fallback
      if [[ -z "$ID" ]]; then
          ID="$CMD"
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: Using CMD as ID: $ID"; fi
      else
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: Using provided ID: $ID"; fi
      fi

      # Wrap command with kitty if TUI mode
      if [[ "$TUI" == "1" ]]; then
          CMD="kitty --class $ID $CMD"
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: TUI mode enabled, command is now: $CMD"; fi
      fi

      if [[ "$DEBUG" == "1" ]]; then echo "Debug: Checking for open app with ID: $ID"; fi

      # Check if app is already open using niri msg windows
      # Parse the text output to find matching App ID and extract Window ID
      WINDOW_ID=$(niri msg windows | awk '
      /^Window ID / { wid = $3; sub(/:$/, "", wid) }
      /  App ID: "'"$ID"'"/ { print wid; exit }
      ')

      if [[ -n "$WINDOW_ID" ]]; then
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: App is open with window ID: $WINDOW_ID. Focusing..."; fi
          niri msg action focus-window --id "$WINDOW_ID"
      else
          if [[ "$DEBUG" == "1" ]]; then echo "Debug: App not open. Spawning: $CMD"; fi
           niri msg action spawn -- sh -c "$CMD"
      fi
  fi
''
