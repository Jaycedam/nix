{
  pkgs,
  ...
}:
{
  programs = {
    lazygit.enable = true;
    git.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # tools
    opencode
    antigravity
    codex
    claude-code
    gh
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
    prettier
    eslint

    # Python
    pyright
    ruff

    # C/C++
    gcc # compiler

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
