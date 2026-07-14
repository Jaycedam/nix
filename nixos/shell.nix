_: {
  programs.fish = {
    enable = true;

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
  };
}
