{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Jay";
    userEmail = "45575946+jaycem-dev@users.noreply.github.com";

    extraConfig = {
      pull.rebase = true;
    };

    settings = [
      {
        credential = {
          "https://github.com" = {
            helper = "";
          };
        };
      }
      {
        credential = {
          "https://github.com" = {
            helper = "!${pkgs.gh}/bin/gh auth git-credential";
          };
        };
      }
      {
        credential = {
          "https://gist.github.com" = {
            helper = "";
          };
        };
      }
      {
        credential = {
          "https://gist.github.com" = {
            helper = "!${pkgs.gh}/bin/gh auth git-credential";
          };
        };
      }
    ];
  };
}
