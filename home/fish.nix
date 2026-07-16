_: {
  programs.fish = {
    enable = true;

    shellInit = ''
      fish_add_path -g $HOME/.local/bin
    '';

    interactiveShellInit = ''
      set fish_greeting ""
      zoxide init fish | source
      fzf --fish | source
      bind \cZ fzf-cd-widget
      bind --mode insert \cZ fzf-cd-widget
      fish_config theme choose "catppuccin-mocha"
    '';

    shellAbbrs = {
      v = "nvim";
      n = "nvim";
      h = "hx";
      ll = "ls -lA";
      lg = "lazygit";
      oc = "opencode";
      gp = "git pull";
      gs = "git status";
    };

    functions = {
      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
