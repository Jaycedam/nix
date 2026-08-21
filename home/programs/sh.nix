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
    carapace.enable = true; # completions
    bash.enable = true; # needed to load sessionVariables in compositor
    nushell = {
      enable = true;
      environmentVariables.PROMPT_COMMAND_RIGHT = "";
      settings = {
        show_banner = false;
        edit_mode = "vi";
        completions.external.enable = true;
      };
    };
  };
}
