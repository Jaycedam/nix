{ pkgs, ... }:

pkgs.writeShellScriptBin "hypr-brightness" ''
  # Usage: hypr_brightness.sh up|down
  # Adjusts brightness on all available monitors (internal or external)

  # Step 1: Determine brightness change direction
  case "$1" in
      up) CHANGE="10%+" ;;
      down) CHANGE="10%-" ;;
      *) echo "Usage: $0 up|down"; exit 1 ;;
  esac

  # Step 2: Adjust external DDC/CI monitors
  if command -v ddcutil >/dev/null 2>&1; then
      EXTERNAL_MONITORS=$(sudo ddcutil detect 2>/dev/null | grep -E "Display [0-9]+" | awk '{print $2}')
      
      if [ -n "$EXTERNAL_MONITORS" ]; then
          for DISP in $EXTERNAL_MONITORS; do
              CUR=$(sudo ddcutil --display $DISP getvcp 10 | grep -oP 'current value = \K\d+')
              MAX=$(sudo ddcutil --display $DISP getvcp 10 | grep -oP 'max value = \K\d+')
              
              if [ "$1" = "up" ]; then
                  NEW=$((CUR + MAX / 10))
              else
                  NEW=$((CUR - MAX / 10))
              fi
              
              # Clamp values
              if [ "$NEW" -lt 0 ]; then NEW=0; fi
              if [ "$NEW" -gt "$MAX" ]; then NEW=$MAX; fi

              sudo ddcutil --display $DISP setvcp 10 $NEW
          done
          exit 0
      fi
  fi

  # Step 3: Adjust internal display if no external monitors
  if command -v brightnessctl >/dev/null 2>&1; then
      brightnessctl s $CHANGE
  fi
''
