{pkgs, ...}:
pkgs.writeShellApplication {
  name = "tmux-sessions";
  runtimeInputs = with pkgs; [
    fd
    fzf
    tmux
    neovim
  ];
  text = ''
    paths="$HOME/Projects"

    selection=$(fd -t d . "$paths" --max-depth 1 --format '{/}' | fzf --popup center --border-label ' Session Manager ')

    if [ -z "$selection" ]; then
        exit 0
    fi

    project_path="$paths/$selection"
    session_name=$(echo "$selection" | tr . _)

    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -d -s "$session_name" -c "$project_path"
    fi

    if [ -z "$TMUX" ]; then
        tmux attach -t "$session_name"
    else
        tmux switch-client -t "$session_name"
    fi
  '';
}
