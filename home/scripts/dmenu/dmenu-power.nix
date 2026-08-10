{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dmenu-power";
  runtimeInputs = with pkgs; [fuzzel swaylock];

  text = ''
    declare -A items=(
        [lock]=" Lock"
        [suspend]=" Suspend"
        [reboot]=" Reboot"
        [shutdown]=" Shutdown"
    )

    selected=$(printf '%s\n' "''${items[@]}" | fuzzel --dmenu)

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
                    shutdown -r now
                    ;;
                shutdown)
                    shutdown now
                    ;;
                esac
                break
            fi
        done
    fi
  '';
}
