{ lib, ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enable = true;
      quickfile.enable = true;
      explorer.enable = true;
      git.enable = true;
      gitbrowse.enable = true;
      image.enable = true;
      indent.enable = true;
      input.enable = true;
      lazygit.enable = true;
      notifier.enable = true;
      picker.enable = true;
      scroll.enable = true;
      terminal.enable = true;
    };
  };

  keymaps = [
    ## pickers and explorer
    {
      action = lib.nixvim.mkRaw "function() Snacks.explorer() end";
      mode = "n";
      key = "<leader>e";
      options = {
        silent = true;
        desc = "File explorer";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.buffers() end";
      mode = "n";
      key = "<leader>b";
      options = {
        silent = true;
        desc = "Find buffers";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep() end";
      mode = "n";
      key = "<leader>/";
      options = {
        silent = true;
        desc = "Grep project";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.files() end";
      mode = "n";
      key = "<leader>f";
      options = {
        silent = true;
        desc = "Find files";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.projects() end";
      mode = "n";
      key = "<leader>p";
      options = {
        silent = true;
        desc = "Find projects";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep_word() end";
      key = "<leader>/";
      mode = [
        "v"
        "x"
      ];
      options = {
        silent = true;
        desc = "Find projects";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.diagnostics() end";
      mode = "n";
      key = "<leader>d";
      options = {
        silent = true;
        desc = "Diagnostics";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.diagnostics_buffer() end";
      mode = "n";
      key = "<leader>D";
      options = {
        silent = true;
        desc = "Diagnostics (buffer)";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.help() end";
      mode = "n";
      key = "<leader>h";
      options = {
        silent = true;
        desc = "Help";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.keymaps() end";
      mode = "n";
      key = "<leader>k";
      options = {
        silent = true;
        desc = "Keymaps";
      };
    }
    ## git
    {
      action = lib.nixvim.mkRaw "function() Snacks.lazygit() end";
      mode = "n";
      key = "<leader>G";
      options = {
        silent = true;
        desc = "Lazygit";
      };
    }
    ## lsp
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_definitions() end";
      mode = "n";
      key = "<leader>gd";
      options = {
        silent = true;
        desc = "LSP definitions";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_declarations() end";
      mode = "n";
      key = "<leader>gD";
      options = {
        silent = true;
        desc = "LSP declarations";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_references() end";
      mode = "n";
      key = "<leader>r";
      options = {
        silent = true;
        desc = "LSP references";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_implementations() end";
      mode = "n";
      key = "<leader>i";
      options = {
        silent = true;
        desc = "LSP implementations";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_type_definitions() end";
      mode = "n";
      key = "<leader>t";
      options = {
        silent = true;
        desc = "LSP type definitions";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_symbols() end";
      mode = "n";
      key = "<leader>s";
      options = {
        silent = true;
        desc = "LSP symbols";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_workspace_symbols() end";
      mode = "n";
      key = "<leader>S";
      options = {
        silent = true;
        desc = "LSP workspace symbols";
      };
    }
    ## other
    {
      action = lib.nixvim.mkRaw "function() Snacks.zen() end";
      mode = "n";
      key = "<leader>z";
      options = {
        silent = true;
        desc = "Toggle zen mode";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.terminal() end";
      mode = "n";
      key = "<c-/>";
      options = {
        silent = true;
        desc = "Toggle terminal";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.terminal.toggle('opencode') end";
      key = "<c-o>";
      mode = [
        "n"
        "t"
      ];
      options = {
        silent = true;
        desc = "Toggle opencode terminal";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.scratch() end";
      mode = "n";
      key = "<leader>.";
      options = {
        silent = true;
        desc = "Toggle scratch buffer";
      };
    }
    {
      action = lib.nixvim.mkRaw "function() Snacks.gitbrowse() end";
      key = "<leader>B";
      mode = [
        "n"
        "v"
      ];
      options = {
        silent = true;
        desc = "Git browse";
      };
    }
  ];
}
