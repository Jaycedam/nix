{ ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-t";
    reverseSplit = true;
    baseIndex = 1;
    escapeTime = 0;
    focusEvents = true;
    historyLimit = 5000;
    keyMode = "vi";
    mouse = true;
    terminal = "screen-256color";
    extraConfig = ''
      set -g renumber-windows on
      set -g popup-border-lines "rounded"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind r source-file "$HOME/.config/tmux/tmux.conf" \; display-message "Config reloaded..."

      # Session manager
      bind k display-popup -w 90% -h 90% -E tmux-sessions
      # lazygit
      bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E lazygit
      # ai
      bind a new-window -c "#{pane_current_path}" -n AI "opencode"
      # Open remote git repository on the Browser
      bind b run-shell "gh browse"
    '';
  };
}
