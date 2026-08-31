#!/usr/bin/env bash
step=${2:-5}
ext_step=10

if [ "$1" = "up" ]; then
    ext_op="+"
    int_op="+${step}%"
elif [ "$1" = "down" ]; then
    ext_op="-"
    int_op="${step}%-"
else
    echo "Usage: $(basename "$0") up|down [step]" >&2
    exit 1
fi

if ddcutil setvcp 10 "$ext_op" "$ext_step" --sleep-multiplier 0.1 >/dev/null 2>&1; then
    vcp_output=$(ddcutil getvcp 10 --sleep-multiplier 0.1)
    current=$(echo "$vcp_output" | grep -oP 'current value =\s*\K\d+')
    max=$(echo "$vcp_output" | grep -oP 'max value =\s*\K\d+')
    percent=$((current * 100 / max))
else
    echo "Warning: failed to adjust external display via ddcutil" >&2
fi

if brightnessctl --class=backlight set "$int_op" >/dev/null 2>&1; then
    current=$(brightnessctl --class=backlight get)
    max=$(brightnessctl --class=backlight max)
    percent=$((current * 100 / max))
else
    echo "Warning: failed to adjust internal display via brightnessctl" >&2
fi

if [ -n "$percent" ]; then
    notify-send -c osd -h string:x-canonical-private-synchronous:osd -h int:value:"${percent}" " $percent%"
fi
