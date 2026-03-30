{ pkgs, ... }:

pkgs.writeShellScriptBin "niri-launch-or-focus-webapp" ''
  show_help() {
      echo "Usage: $0 [OPTIONS] URL"
      echo "Launch or focus a Brave webapp for the given URL."
      echo ""
      echo "URL: The domain of the webapp (e.g., open.spotify.com)"
      echo ""
      echo "OPTIONS:"
      echo "  --debug                Enable debug output"
      echo "  --profile PROFILE_NAME Specify Brave profile (default: Default)"
      echo "  -h, --help             Show this help message"
  }

  DEBUG=0
  PROFILE="Default"
  URL=""

  while [ $# -gt 0 ]; do
      case $1 in
          --debug)
              DEBUG=1
              shift
              ;;
          --profile)
              PROFILE="$2"
              shift 2
              ;;
          --help|-h)
              show_help
              exit 0
              ;;
          -*)
              echo "Error: Unknown option $1"
              show_help
              exit 1
              ;;
          *)
              if [ -n "$URL" ]; then
                  echo "Error: Multiple URLs provided."
                  exit 1
              fi
              URL="$1"
              shift
              ;;
      esac
  done

  if [ -z "$URL" ]; then
      echo "Error: URL is required."
      echo ""
      show_help
      exit 1
  fi

  # Construct APP_ID based on the assumed format
  APP_ID="brave-''${URL}__-''${PROFILE}"

  [ "$DEBUG" = 1 ] && echo "URL: $URL"
  [ "$DEBUG" = 1 ] && echo "PROFILE: $PROFILE"
  [ "$DEBUG" = 1 ] && echo "APP_ID: $APP_ID"

  # Check if the window with the given app_id is already running
  [ "$DEBUG" = 1 ] && echo "Checking for existing window with APP_ID: $APP_ID"
  if niri msg --json windows | jq -e '.[] | select(.app_id == "'"$APP_ID"'")' >/dev/null 2>&1; then
      # Get the window ID and focus it
      WINDOW_ID=$(niri msg --json windows | jq '.[] | select(.app_id == "'"$APP_ID"'") | .id')
      [ "$DEBUG" = 1 ] && echo "Window found, focusing on ID: $WINDOW_ID"
      niri msg action focus-window --id "$WINDOW_ID"
  else
      # Launch the webapp using the launch script
      [ "$DEBUG" = 1 ] && echo "No window found, launching webapp"
      launch-webapp "$URL" "$PROFILE"
  fi
''
