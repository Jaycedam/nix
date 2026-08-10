{pkgs, ...}:
pkgs.writeShellApplication {
  name = "dmenu-projects";

  text = ''
    id=""
    cmd=""
    search_dir="$HOME/Projects"

    while [ $# -gt 0 ]; do
        case "$1" in
        --id)
            id="$2"
            shift 2
            ;;
        *)
            if [ -z "$cmd" ]; then
                cmd="$1"
            else
                search_dir="$1"
            fi
            shift
            ;;
        esac
    done

    [ -z "$id" ] && id="$cmd"

    mapfile -t dirs < <(fd -t d --max-depth 1 . "$search_dir")

    names=()
    for dir in "''${dirs[@]}"; do
        names+=("$(basename "$dir")")
    done

    selected=$(printf '%s\n' "''${names[@]}" | fuzzel --dmenu -p "Select project (''${cmd}) > ")

    if [[ -n "$selected" ]]; then
        for dir in "''${dirs[@]}"; do
            if [[ "$(basename "$dir")" == "$selected" ]]; then
                kitty --app-id "$id" --working-directory "$dir" "$cmd"
                break
            fi
        done
    fi
  '';
}
