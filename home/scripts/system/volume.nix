{ pkgs, ... }:

pkgs.writeShellScriptBin "volume" ''
  help() {
      cat <<EOF
  Usage: $(basename "$0") up|down|mute|micmute [step]

  Adjust audio volume or mute state and notify with percentage.

  Commands:
    up               Increase volume
    down             Decrease volume
    mute             Toggle audio sink mute
    micmute          Toggle audio source mute

  Options:
    step             Volume step (0-100, default: 5)

  Flags:
    -h, --help       Show this help message

  Dependencies: wpctl (wireplumber), notify-send
  EOF
  }

  case " $* " in
  *" --help "* | *" -h "*)
      help
      exit 0
      ;;
  esac

  if [ "$#" -lt 1 ] || [ "$#" -gt 2 ] || { [ "$1" != "up" ] && [ "$1" != "down" ] && [ "$1" != "mute" ] && [ "$1" != "micmute" ]; }; then
      help >&2
      exit 1
  fi

  step=''${2:-5}

  if ! [[ "$step" =~ ^[0-9]+$ ]] || [ "$step" -lt 0 ] || [ "$step" -gt 100 ]; then
      echo "Error: step must be a number between 0-100"
      exit 1
  fi

  CURRENT_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
  CURRENT_PERCENT=$(awk "BEGIN {printf \"%.0f\", $CURRENT_VOL * 100}")
  ICON=""

  if [ "$1" = "mute" ]; then
      wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
          NEW_PERCENT=0
          ICON=""
      else
          NEW_PERCENT=$CURRENT_PERCENT
          ICON=""
      fi
  elif [ "$1" = "micmute" ]; then
      wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      MIC_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2}')
      MIC_PERCENT=$(awk "BEGIN {printf \"%.0f\", $MIC_VOL * 100}")
      if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED; then
          NEW_PERCENT=0
          ICON="󰍭"
      else
          NEW_PERCENT=$MIC_PERCENT
          ICON="󰍬"
      fi
  fi

  if [ "$1" = "up" ] || [ "$1" = "down" ]; then
      wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
      dir=$([ "$1" = "up" ] && echo "+" || echo "-")
      wpctl set-volume @DEFAULT_AUDIO_SINK@ "''${step}%''${dir}"
      NEW_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
      NEW_PERCENT=$(awk "BEGIN {printf \"%.0f\", $NEW_VOL * 100}")
  fi

  notify-send -c osd -h string:x-canonical-private-synchronous:osd -h int:value:"$NEW_PERCENT" "$ICON $NEW_PERCENT%"
''
