{ pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = [
      {
        user.name = "Jay";
        user.email = "45575946+jaycem-dev@users.noreply.github.com";
      }
      {
        pull.rebase = true;
      }
      {
        credential."https://github.com".helper = "";
      }
      {
        credential."https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
      }
      {
        credential."https://gist.github.com".helper = "";
      }
      {
        credential."https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
      }
    ];
  };
}
