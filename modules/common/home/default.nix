{
  pkgs,
  ...
}:
{
  home.username = "jay";

  # large configs go to ./programs/
  # consider move them all?
  imports = [
    ./neovim/default.nix
    ./helix.nix
    ./tmux.nix
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
        credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
    };
    bat = {
      enable = true;
    };
    btop.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "hx";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    kitty = {
      enable = true;
      settings = {
        cursor_trail = 1;
      };
    };
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };

  # don't change this
  home.stateVersion = "25.11";
}
