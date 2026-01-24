_: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+jaycem-dev@users.noreply.github.com";
        };
      };
    };

    # remote and related tools
    gh = {
      enable = true;
      gitCredentialHelper.enable = true; # Defaults to github.com and gist.github.com
    };
  };
}
