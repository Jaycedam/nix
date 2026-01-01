{ pkgs, ... }:

pkgs.writeShellScriptBin "rofi-power-menu" ''
  declare -A items=(
      [lock]="  Lock"
      [suspend]="  Suspend"
      [reboot]="  Reboot"
      [shutdown]="  Shutdown"
      [logout]="  Logout"
  )

  # Display options with rofi
  selected=$(printf '%s\n' "''${items[@]}" | rofi -dmenu -p "Select action")

  # Find the key for the selected value and perform action
  if [[ -n "$selected" ]]; then
      for key in "''${!items[@]}"; do
          if [[ "''${items[$key]}" == "$selected" ]]; then
              case $key in
              lock)
                  hyprlock
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
              logout)
                   command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
                  ;;
              esac
              break
          fi
      done
  fi
''
