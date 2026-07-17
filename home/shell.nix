_: {
  programs = {
    # needed to propagate home.sessionVariables to compositor
    bash.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
        bind \cZ fzf-cd-widget
      '';

      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        ll = "ls -lA";
        oc = "opencode";
        gp = "git pull";
        gs = "git status";
      };
    };
  };
}
