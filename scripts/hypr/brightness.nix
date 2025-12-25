{ pkgs, ... }:

pkgs.writeShellScriptBin "hypr-brightness" ''
  if [ "$#" -ne 1 ] || { [ "$1" != "up" ] && [ "$1" != "down" ]; }; then
      echo "Usage: $0 up|down"
      exit 1
  fi

  # Adjust external monitors using ddcutil
  if command -v ddcutil >/dev/null 2>&1; then
      # Get list of displays
      displays=$(ddcutil detect | grep "Display" | awk '{print $2}' | tr -d ':')
      for disp in $displays; do
          # Check if monitor supports brightness control (VCP 10)
          if ddcutil getvcp 10 --display "$disp" >/dev/null 2>&1; then
              # Get current brightness and max value
              vcp_output=$(ddcutil getvcp 10 --display "$disp")
              current=$(echo "$vcp_output" | grep -oP 'current value =\s*\K\d+')
              max=$(echo "$vcp_output" | grep -oP 'max value =\s*\K\d+')
              if [ "$1" = "up" ]; then
                  new=$((current + 10))
                  if [ "$new" -gt "$max" ]; then
                      new=$max
                  fi
              else
                  new=$((current - 10))
                  if [ "$new" -lt 0 ]; then
                      new=0
                  fi
              fi
              ddcutil setvcp 10 "$new" --display "$disp"
          fi
      done
  fi

  # Adjust internal display using brightnessctl
  if command -v brightnessctl >/dev/null 2>&1 && brightnessctl -c backlight get >/dev/null 2>&1; then
      # Get current and max brightness
      current=$(brightnessctl -c backlight get)
      max=$(brightnessctl -c backlight max)
      if [ "$1" = "up" ]; then
          new=$((current + 10))
          if [ "$new" -gt "$max" ]; then
              new=$max
          fi
      else
          new=$((current - 10))
          if [ "$new" -lt 0 ]; then
              new=0
          fi
      fi
      brightnessctl -c backlight set "$new"
  fi
''
