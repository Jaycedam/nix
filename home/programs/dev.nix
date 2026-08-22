{pkgs, ...}: {
  programs = {
    lazygit.enable = true;
    devenv.enable = true;
    antigravity-cli.enable = true;
    codex.enable = true;
    gh.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        pull.rebase = true;
        user = {
          name = "Jay";
          email = "45575946+jaycem-dev@users.noreply.github.com";
        };
      };
    };

    opencode = {
      enable = true;
      tui.attention = {
        enabled = true;
        sound = false;
      };
      settings = {
        permission = {
          external_directory = {
            "/nix/store/**" = "allow";
            "/tmp/**" = "allow";
            "~/.config/**" = "allow";
          };
          edit = {
            "/nix/store/**" = "deny";
            "~/.config/**" = "ask";
          };
        };
      };
    };

    npm = {
      enable = true;
      settings.min-release-age = 30;
    };
  };

  home.packages = with pkgs; [
    android-tools
    grok-build
  ];
}
