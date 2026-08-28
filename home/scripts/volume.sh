#!/usr/bin/env bash
step=5

notify() {
    local target=$1
    local muted_icon=$2
    local icon=$3
    local vol percent output

    output=$(wpctl get-volume "$target")
    vol=$(printf '%s' "$output" | awk '{print $2}')
    percent=$(awk "BEGIN {printf \"%.0f\", $vol * 100}")

    if printf '%s' "$output" | grep -q MUTED; then
        percent=0
        icon=$muted_icon
    fi

    notify-send -c osd -h string:x-canonical-private-synchronous:osd -h int:value:"$percent" "$icon $percent%"
}

VOLUME_ICON=""
MUTED_ICON=""
MIC_MUTED_ICON="󰍭"
MIC_ICON="󰍬"

if [ "$1" = "up" ] || [ "$1" = "down" ]; then
    [ "$1" = "down" ] && dir="-" || dir="+"
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${step}%${dir}" -l 1.0
    notify @DEFAULT_AUDIO_SINK@ "$MUTED_ICON" "$VOLUME_ICON"
elif [ "$1" = "mute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    notify @DEFAULT_AUDIO_SINK@ "$MUTED_ICON" "$VOLUME_ICON"
elif [ "$1" = "micmute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    notify @DEFAULT_AUDIO_SOURCE@ "$MIC_MUTED_ICON" "$MIC_ICON"
else
    echo "Usage: $(basename "$0") up|down|mute|micmute" >&2
    exit 1
fi
