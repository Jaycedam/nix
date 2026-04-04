{
  pkgs,
  ...
}:
{
  programs = {
    opencode.enable = true;
    gemini-cli.enable = true;

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "jaycem";
          email = "45575946+jaycem-dev@users.noreply.github.com";
        };
      };
    };

    # remote and related tools
    gh = {
      enable = true;
      gitCredentialHelper.enable = true; # Defaults to github.com and gist.github.com
    };
  };

  home.packages = with pkgs; [
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

    # Dev tools
    lazygit
    android-tools
  ];
}
