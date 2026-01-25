{ pkgs, ... }:

pkgs.writeShellScriptBin "brightness" ''
  if [ "$#" -ne 1 ] || { [ "$1" != "up" ] && [ "$1" != "down" ]; }; then
  	echo "Usage: $0 up|down"
  	exit 1
  fi

  STEP=5

   # Adjust external monitors using ddcutil
  displays=$(ddcutil detect --sleep-multiplier 0.5 | grep "Display" | awk '{print $2}' | tr -d ':')
  for disp in $displays; do
  	# Check if monitor supports brightness control (VCP 10)
  	if ddcutil getvcp 10 --display "$disp" --sleep-multiplier 0.5 >/dev/null 2>&1; then
  		if [ "$1" = "up" ]; then
  			if ddcutil setvcp 10 + $STEP --display "$disp" --sleep-multiplier 0.5 >/dev/null 2>&1; then
  				# Get current percentage after adjustment
  				vcp_output=$(ddcutil getvcp 10 --display "$disp" --sleep-multiplier 0.5)
  				current=$(echo "$vcp_output" | grep -oP 'current value =\s*\K\d+')
  				max=$(echo "$vcp_output" | grep -oP 'max value =\s*\K\d+')
  				percent=$((current * 100 / max))
  				last_percent=$percent
  			else
  				external_failed=true
  			fi
  		else
  			if ddcutil setvcp 10 - $STEP --display "$disp" --sleep-multiplier 0.5 >/dev/null 2>&1; then
  				# Get current percentage after adjustment
  				vcp_output=$(ddcutil getvcp 10 --display "$disp" --sleep-multiplier 0.5)
  				current=$(echo "$vcp_output" | grep -oP 'current value =\s*\K\d+')
  				max=$(echo "$vcp_output" | grep -oP 'max value =\s*\K\d+')
  				percent=$((current * 100 / max))
  				last_percent=$percent
  			else
  				external_failed=true
  			fi
  		fi
  	fi
  done

  # Adjust internal display using brightnessctl
  if command -v brightnessctl >/dev/null 2>&1 && brightnessctl --class=backlight get >/dev/null 2>&1; then
  	if [ "$1" = "up" ]; then
  		if brightnessctl --class=backlight set +$STEP% >/dev/null 2>&1; then
  			# Get current percentage after adjustment
  			current=$(brightnessctl --class=backlight get)
  			max=$(brightnessctl --class=backlight max)
  			percent=$((current * 100 / max))
  			last_percent=$percent
  		else
  			internal_failed=true
  		fi
  	else
  		if brightnessctl --class=backlight set $STEP%- >/dev/null 2>&1; then
  			# Get current percentage after adjustment
  			current=$(brightnessctl --class=backlight get)
  			max=$(brightnessctl --class=backlight max)
  			percent=$((current * 100 / max))
  			last_percent=$percent
  		else
  			internal_failed=true
  		fi
  	fi
  fi

  # OSD feedback
  if command -v notify-send >/dev/null; then
  	if [ -n "$last_percent" ]; then
    		notify-send -c osd -h string:x-canonical-private-synchronous:osd -h int:value:''${last_percent} " "
  	fi
  	if [ "$external_failed" = "true" ]; then
  		notify-send "Brightness Error" "Failed to adjust external monitor brightness"
  	fi
  	if [ "$internal_failed" = "true" ]; then
  		notify-send "Brightness Error" "Failed to adjust internal display brightness"
  	fi
  fi
''
