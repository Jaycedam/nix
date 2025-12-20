{ pkgs, ... }: {
  programs = {
    lazygit.enable = true;
    antigravity-cli.enable = true;
    codex.enable = true;
    claude-code.enable = true;
    gh.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Jay";
          email = "45575946+jaycem-dev@users.noreply.github.com";
        };
        pull.rebase = true;
      };
    };
    opencode = {
      enable = true;
      tui.attention = {
        enabled = true;
        sound = false;
      };
    };
    npm = {
      enable = true;
      settings = {
        "min-release-age" = 30;
      };
    };
  };

  home.packages = with pkgs; [
    # tools
    android-tools
    tree-sitter

    # Go
    go
    gopls

    # Rust
    rustc
    cargo
    rust-analyzer

    # TypeScript/JavaScript
    oxfmt
    oxlint
    nodejs
    typescript-language-server
    eslint

    # Python
    pyright
    ruff

    # C/C++
    gcc

    # Bash
    bash-language-server
    shfmt
    shellcheck

    # Astro
    astro-language-server

    # HTML/CSS
    vscode-langservers-extracted

    # Tailwind
    tailwindcss-language-server

    # Markdown
    marksman

    # Lua
    lua-language-server
    stylua

    # TOML
    taplo

    # YAML
    yaml-language-server

    # Nix
    nil
    nixfmt
    statix

    # Django
    djlint
  ];
}
