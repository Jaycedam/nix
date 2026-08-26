{pkgs, ...}:
pkgs.writeShellApplication {
  name = "launch-or-focus";
  runtimeInputs = with pkgs; [jq];

  text = ''
    usage() {
        echo "Launch or focus windows on niri"
        echo "Usage: $0 <mode> [args...]"
        echo ""
        echo "Modes:"
        echo "  <command>                        Run command directly (default)"
        echo "  --tui <command>                  Launch command in kitty terminal"
        echo "  --webapp <url>                   Launch webapp for URL (needs a Chromium-based browser, default: brave-origin)"
        echo ""
        echo "Options:"
        echo "  --id <app_id>                    App ID for window matching (defaults to command/url)"
        echo "  -h, --help                       Show this help message"
    }

    MODE=""
    ID=""
    CMD_ARGS=()
    WEBAPP_BROWSER="''${WEBAPP_BROWSER:-brave-origin}" # needs to be a Chromium-based browser
    WEBAPP_BROWSER_ID="''${WEBAPP_BROWSER_ID:-brave}" # the string that's added to the ID

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
            [ -n "$MODE" ] && {
                echo "Error: conflicting modes"
                usage
                exit 1
            }
            MODE=tui
            CMD_ARGS=(kitty -1 --app-id "''${ID:-$2}" "$2")
            [ -z "$ID" ] && ID="$2"
            shift 2
            ;;
        --webapp)
            [ -n "$MODE" ] && {
                echo "Error: conflicting modes"
                usage
                exit 1
            }
            MODE=webapp
            CMD_ARGS=("$WEBAPP_BROWSER" --app="https://$2")
            [ -z "$ID" ] && ID="$WEBAPP_BROWSER_ID-$2__-Default"
            shift 2
            ;;
        *)
            [ -n "$MODE" ] && {
                echo "Error: conflicting modes"
                usage
                exit 1
            }
            MODE=default
            CMD_ARGS=("$@")
            break
            ;;
        esac
    done

    # if no id is provided, use cmd as the id
    [ -z "$ID" ] && ID="''${CMD_ARGS[0]}"

    # niri's focus-window requires a numeric window ID, not an app_id
    ID=$(niri msg --json windows | jq -r --arg id "$ID" '[.[] | select(.app_id == $id) | .id][0] // empty')

    if [ -n "$ID" ]; then
        niri msg action focus-window --id "$ID"
        exit
    fi

    niri msg action spawn -- "''${CMD_ARGS[@]}"
  '';
}
