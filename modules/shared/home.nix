{ pkgs, ... }:
{
  imports = [
    ../../home/nixvim/default.nix
    ../../home/zen/default.nix
    ../../home/tmux.nix
    ../../home/kitty.nix
  ];

  programs = {
    btop.enable = true;
    fish = {
      enable = true;
      functions = {
        fish_prompt = ''
          set -l host (prompt_login)
          set -l pwd (set_color cyan)(prompt_pwd)
          set -l git (set_color yellow)(fish_git_prompt " %s")
          set -l icon (set_color blue)"❯ "

          if contains -- --final-rendering $argv
            string join "" -- $icon
          else
            string join "" -- $host " " $pwd $git " " $icon
          end
        '';
      };
      interactiveShellInit = ''
        set fish_greeting ""
        set -g fish_transient_prompt 1
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "hx";
        ll = "ls -lA";
      };
    };
    opencode.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true; # Defaults to github.com and gist.github.com
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
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
      settings = {
        mouse-hide-while-typing = "true";
        font-size = "14";
        background-blur = "true";
      };
    };

    alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "Buttonless";
          blur = true;
        };
      };

    };
  };
}
