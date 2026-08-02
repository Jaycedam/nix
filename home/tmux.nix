_: {
  programs.tmux = {
    enable = true;
    newSession = true;
    baseIndex = 1;
    escapeTime = 0;
    focusEvents = true;
    mouse = true;
    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      set -g status-left-length 30
      set -g detach-on-destroy off
      set -g renumber-windows on

      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-right ""
      setw -g window-status-current-format "#[fg=brightwhite] [#I] #W #{?window_zoomed_flag, ,}"
      set -g status-style fg=brightblack,bg=default
      set -g status-left " #[fg=brightwhite]#S #{?client_prefix,#[bg=default]#[fg=brightwhite] ,#[bg=default]#[fg=default]}"

      set -g popup-border-lines "rounded"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind r source-file "$HOME/.config/tmux/tmux.conf" \; display-message "Config reloaded..."

      bind k run-shell "tmux-sessions"
      bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E lazygit
      bind a new-window -c "#{pane_current_path}" -n AI "opencode"
      bind e new-window -c "#{pane_current_path}" -n Files "yazi"
      bind b run-shell "gh browse"
    '';
  };
}
