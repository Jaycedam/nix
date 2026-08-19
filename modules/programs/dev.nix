{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # ai
    antigravity-cli
    codex
    grok-build
    opencode

    # tools
    tree-sitter
    lazygit
    gh
    git
    git-lfs

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
    nixd
    nixfmt
    alejandra
    statix

    # Django
    djlint
  ];
}
