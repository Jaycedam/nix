{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "brightness";
  runtimeInputs = with pkgs; [
    libnotify
    brightnessctl
    ddcutil
  ];
  text = ''
    help() {
        cat <<EOF
    Usage: $(basename "$0") up|down [step]

    Adjust internal and external display brightness and notify with percentage.

    Commands:
      up               Increase brightness
      down             Decrease brightness

    Options:
      step             Brightness step (0-100, default: 5)

    Flags:
      -h, --help       Show this help message
    EOF
    }

    case " $* " in
    *" --help "* | *" -h "*)
        help
        exit 0
        ;;
    esac

    step=''${2:-5}

    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ] || { [ "$1" != "up" ] && [ "$1" != "down" ]; }; then
        help >&2
        exit 1
    fi

    if ! [[ "$step" =~ ^[0-9]+$ ]] || [ "$step" -lt 0 ] || [ "$step" -gt 100 ]; then
        echo "Error: step must be a number between 0-100"
        exit 1
    fi

    if [ "$1" = "up" ]; then
        ext_op="+"
        int_op="+''${step}%"
    else
        ext_op="-"
        int_op="''${step}%-"
    fi

    for disp in $(ddcutil detect --terse --sleep-multiplier 0.1 | grep -oP 'Display \K\d+'); do
        if ddcutil setvcp 10 "$ext_op" "$step" --display "$disp" --sleep-multiplier 0.1 >/dev/null 2>&1; then
            vcp_output=$(ddcutil getvcp 10 --display "$disp" --sleep-multiplier 0.1)
            current=$(echo "$vcp_output" | grep -oP 'current value =\s*\K\d+')
            max=$(echo "$vcp_output" | grep -oP 'max value =\s*\K\d+')
            percent=$((current * 100 / max))
        else
            echo "Warning: failed to adjust external display $disp via ddcutil" >&2
        fi
    done

    if brightnessctl --class=backlight set "$int_op" >/dev/null 2>&1; then
        current=$(brightnessctl --class=backlight get)
        max=$(brightnessctl --class=backlight max)
        percent=$((current * 100 / max))
    else
        echo "Warning: failed to adjust internal display via brightnessctl" >&2
    fi

    if [ -n "$percent" ]; then
        notify-send -c osd -h string:x-canonical-private-synchronous:osd -h int:value:"''${percent}" " $percent%"
    fi
  '';
}
