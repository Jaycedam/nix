{
  programs = {
    # needed to propagate home.sessionVariables
    bash.enable = true;
    fish = {
      enable = true;
      binds."ctrl-z".command = "fzf-cd-widget";
      interactiveShellInit = "set fish_greeting ''";

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
