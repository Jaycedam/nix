{host, ...}: {
  programs = {
    # needed to propagate home.sessionVariables to compositor
    bash.enable = true;
    fish = {
      enable = true;
      binds = {
        "ctrl-z".command = "fzf-cd-widget";
      };
      interactiveShellInit = ''
        set fish_greeting ""
      '';

      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        ll = "ls -lA";
        oc = "opencode";
        gp = "git pull";
        gs = "git status";
        ns =
          if host == "asahi"
          then "nh os switch --impure"
          else "nh os switch";
      };
    };
  };
}
