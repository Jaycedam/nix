_: {
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
      action = "<cmd>lua Snacks.explorer()<CR>";
      mode = "n";
      key = "<leader>e";
      options = {
        silent = true;
        desc = "File explorer";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      mode = "n";
      key = "<leader>b";
      options = {
        silent = true;
        desc = "Find buffers";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      mode = "n";
      key = "<leader>/";
      options = {
        silent = true;
        desc = "Grep project";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.files()<CR>";
      mode = "n";
      key = "<leader>f";
      options = {
        silent = true;
        desc = "Find files";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.projects()<CR>";
      mode = "n";
      key = "<leader>p";
      options = {
        silent = true;
        desc = "Find projects";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.grep_word()<CR>";
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
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      mode = "n";
      key = "<leader>d";
      options = {
        silent = true;
        desc = "Diagnostics";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
      mode = "n";
      key = "<leader>D";
      options = {
        silent = true;
        desc = "Diagnostics (buffer)";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.help()<CR>";
      mode = "n";
      key = "<leader>h";
      options = {
        silent = true;
        desc = "Help";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      mode = "n";
      key = "<leader>k";
      options = {
        silent = true;
        desc = "Keymaps";
      };
    }
    ## git
    {
      action = "<cmd>lua Snacks.lazygit()<CR>";
      mode = "n";
      key = "<leader>G";
      options = {
        silent = true;
        desc = "Lazygit";
      };
    }
    ## lsp
    {
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
      mode = "n";
      key = "<leader>gd";
      options = {
        silent = true;
        desc = "LSP definitions";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
      mode = "n";
      key = "<leader>gD";
      options = {
        silent = true;
        desc = "LSP declarations";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
      mode = "n";
      key = "<leader>r";
      options = {
        silent = true;
        desc = "LSP references";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
      mode = "n";
      key = "<leader>i";
      options = {
        silent = true;
        desc = "LSP implementations";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
      mode = "n";
      key = "<leader>t";
      options = {
        silent = true;
        desc = "LSP type definitions";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      mode = "n";
      key = "<leader>s";
      options = {
        silent = true;
        desc = "LSP symbols";
      };
    }
    {
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      mode = "n";
      key = "<leader>S";
      options = {
        silent = true;
        desc = "LSP workspace symbols";
      };
    }
    ## other
    {
      action = "<cmd>lua Snacks.zen()<CR>";
      mode = "n";
      key = "<leader>z";
      options = {
        silent = true;
        desc = "Toggle zen mode";
      };
    }
    {
      action = "<cmd>lua Snacks.terminal()<CR>";
      mode = "n";
      key = "<c-/>";
      options = {
        silent = true;
        desc = "Toggle terminal";
      };
    }
    {
      action = "<cmd>lua Snacks.scratch()<CR>";
      mode = "n";
      key = "<leader>.";
      options = {
        silent = true;
        desc = "Toggle scratch buffer";
      };
    }
    {
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
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
