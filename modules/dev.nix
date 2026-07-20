{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # previously programs.<x>.enable
    lazygit
    antigravity-cli
    codex
    claude-code
    gh
    git
    git-lfs
    opencode

    # tools
    android-tools
    tree-sitter
    grok-build

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
