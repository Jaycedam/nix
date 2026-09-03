{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty -1";
      PAGER = "nvim +Man!";
      BROWSER = "brave-origin";
    };

    shellAliases = {
      v = "nvim";
      n = "nvim";
      gp = "git pull";
      gs = "git status";
      gP = "git push";
      oc = "opencode";
      gc = "git commit -m";
      rm = "trash";
      cp = "cp -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
    };
  };

  programs = {
    bash.enable = true; # needed to load env in compositor

    carapace = {
      enable = true;
      ignoreCase = true;
    };

    starship = {
      enable = true;
      presets = ["no-runtime-versions"];
      settings.package.disabled = true;
    };

    zsh = {
      enable = true;
      defaultKeymap = "viins";
      localVariables.KEYTIMEOUT = "1";
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion = {
        enable = true;
        strategy = ["completion"];
      };
      history = {
        ignoreDups = true;
        saveNoDups = true;
      };
    };
  };
}
