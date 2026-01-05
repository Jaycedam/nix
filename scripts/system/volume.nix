{ pkgs, ... }:

pkgs.writeShellScriptBin "volume" ''
  if [ "$#" -ne 1 ] || { [ "$1" != "up" ] && [ "$1" != "down" ] && [ "$1" != "mute" ] && [ "$1" != "micmute" ]; }; then
    echo "Usage: $0 up|down|mute|micmute"
    exit 1
  fi

  NOTIF_ID=9999
  VOL_INCREMENT=5

   if [ "$1" = "mute" ]; then
     wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
     STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o MUTED || echo UNMUTED)
     if [ "$STATUS" = "MUTED" ]; then
       notify-send -t 2000 -r $NOTIF_ID -h int:value:0 "Volume (Muted)"
     else
       CURRENT_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
       CURRENT_PERCENT=$(awk "BEGIN {printf \"%.0f\", $CURRENT_VOL * 100}")
       notify-send -t 2000 -r $NOTIF_ID -h int:value:"$CURRENT_PERCENT" "Volume"
     fi
     exit 0
   fi

  if [ "$1" = "micmute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -o MUTED || echo UNMUTED)
    if [ "$STATUS" = "MUTED" ]; then
      notify-send -t 2000 -r $NOTIF_ID -h int:value:0 "Mic (Muted)"
    else
      notify-send -t 2000 -r $NOTIF_ID "Mic"
    fi
    exit 0
  fi

   # Get current volume
   CURRENT_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
   CURRENT_PERCENT=$(awk "BEGIN {printf \"%.0f\", $CURRENT_VOL * 100}")

   # Unmute if necessary
   wpctl set-mute @DEFAULT_AUDIO_SINK@ 0

   # Calculate new percent
  if [ "$1" = "up" ]; then
    NEW_PERCENT=$((CURRENT_PERCENT + VOL_INCREMENT))
    if [ $NEW_PERCENT -gt 100 ]; then NEW_PERCENT=100; fi
  else
    NEW_PERCENT=$((CURRENT_PERCENT - VOL_INCREMENT))
    if [ $NEW_PERCENT -lt 0 ]; then NEW_PERCENT=0; fi
  fi

  # Set volume
  NEW_VOL=$(awk "BEGIN {printf \"%.2f\", $NEW_PERCENT / 100}")
   wpctl set-volume @DEFAULT_AUDIO_SINK@ "$NEW_VOL" -l 1.0

  # Show OSD with progress bar
  notify-send -t 2000 -r $NOTIF_ID -h int:value:$NEW_PERCENT "Volume"
''
