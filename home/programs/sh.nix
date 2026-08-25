{
  home.shellAliases = {
    v = "nvim";
    n = "nvim";
    gp = "git pull";
    gs = "git status";
    gP = "git push";
    oc = "opencode";
    gc = "git commit -m";
  };

  programs = {
    bash.enable = true; # needed to load sessionVariables in compositor

    carapace = {
      enable = true;
      ignoreCase = true;
    };

    starship = {
      enable = true;
      presets = ["no-runtime-versions"];
    };

    zsh = {
      enable = true;
      defaultKeymap = "viins";
      localVariables.KEYTIMEOUT = "1";
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion = {
        enable = true;
        strategy = ["completion" "history"];
      };
      history = {
        ignoreDups = true;
        saveNoDups = true;
      };
    };
  };
}
