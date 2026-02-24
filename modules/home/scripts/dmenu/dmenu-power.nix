{ pkgs, ... }:

pkgs.writeShellScriptBin "dmenu-power" ''
  declare -A items=(
      [lock]="  Lock"
      [suspend]="  Suspend"
      [reboot]="  Reboot"
      [shutdown]="  Shutdown"
  )

   # Display options with fuzzel
   selected=$(printf '%s\n' "''${items[@]}" | fuzzel --dmenu -p "Select action: ")

  # Find the key for the selected value and perform action
  if [[ -n "$selected" ]]; then
      for key in "''${!items[@]}"; do
          if [[ "''${items[$key]}" == "$selected" ]]; then
              case $key in
              lock)
                  swaylock
                  ;;
              suspend)
                  systemctl suspend
                  ;;
              reboot)
                  systemctl reboot
                  ;;
              shutdown)
                  systemctl poweroff
                  ;;
              esac
              break
          fi
      done
  fi
''
