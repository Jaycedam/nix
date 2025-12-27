{
  pkgs,
  ...
}:
{
  # home-manager configuration
  home.stateVersion = "25.11";

  # large configs go to separate files
  imports = [
    ../home/neovim/default.nix
    ../home/helix.nix
    ../home/tmux.nix
    ../home/kitty.nix
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
    zoxide = {
      enable = true;
      enableFishIntegration = true;
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
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };
}
