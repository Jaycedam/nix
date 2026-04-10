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
    gemini-cli
    gh
    android-tools

    # Go
    go # compiler
    gopls # LSP

    # Rust
    rustc # compiler
    cargo # package manager
    rust-analyzer # LSP

    # TypeScript/JavaScript
    nodejs_24 # runtime
    bun # runtime/package manager
    typescript-language-server # LSP
    prettier # formatter
    eslint # linter

    # Python
    pyright # LSP
    ruff # formatter/linter

    # C/C++
    gcc # compiler

    # Bash
    bash-language-server # LSP
    shfmt # formatter
    shellcheck # linter

    # Astro
    astro-language-server # LSP

    # HTML/CSS
    vscode-langservers-extracted # LSP (HTML, CSS, JSON)

    # Tailwind
    tailwindcss-language-server # LSP

    # Markdown
    marksman # LSP

    # Lua
    lua-language-server # LSP
    stylua # formatter

    # TOML
    taplo # LSP

    # YAML
    yaml-language-server # LSP

    # Nix
    nil # LSP
    nixfmt # formatter
    statix # linter

    # Django
    djlint # formatter
  ];
}
