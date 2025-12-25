{
  pkgs,
  ...
}:
{
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  # large configs go to ./programs/
  # consider move them all?
  imports = [
    ./programs/neovim/neovim.nix
    ./programs/helix.nix
    ./programs/tmux.nix
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
      loginShellInit = ''
        # autostart hyprland on tty1 
        if status is-login
            if test -z "$DISPLAY" -a (tty) = /dev/tty1
                if uwsm check may-start
                    uwsm start default
                end
            end
        end
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "helix";
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

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # don't change this
  home.stateVersion = "25.11";
}
