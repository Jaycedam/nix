[
  # flash.nvim
  {
    key = "<leader>w";
    mode = [
      "n"
      "x"
      "o"
    ];
    action = "<cmd>lua require('flash').jump()<CR>";
    options = {
      desc = "Jump to word";
    };
  }
  {
    key = "<leader>W";
    mode = [
      "n"
      "x"
      "o"
    ];
    action = "<cmd>lua require('flash').treesitter()<CR>";
    options = {
      desc = "Jump to treesitter block";
    };
  }

  # snacks.nvim
  ## pickers and explorer
  {
    action = "<cmd>lua Snacks.explore()<CR>";
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
    key = "<leader>g";
    options = {
      silent = true;
      desc = "Lazygit";
    };
  }
  ## lsp
  {
    action = "<cmd>lua Snacks.lsp_definitions()<CR>";
    mode = "n";
    key = "<leader>d";
    options = {
      silent = true;
      desc = "LSP definitions";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_declarations()<CR>";
    mode = "n";
    key = "<leader>D";
    options = {
      silent = true;
      desc = "LSP declarations";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_references()<CR>";
    mode = "n";
    key = "<leader>r";
    options = {
      silent = true;
      desc = "LSP references";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_implementations()<CR>";
    mode = "n";
    key = "<leader>i";
    options = {
      silent = true;
      desc = "LSP implementations";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_type_definitions()<CR>";
    mode = "n";
    key = "<leader>t";
    options = {
      silent = true;
      desc = "LSP type definitions";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_symbols()<CR>";
    mode = "n";
    key = "<leader>s";
    options = {
      silent = true;
      desc = "LSP symbols";
    };
  }
  {
    action = "<cmd>lua Snacks.lsp_workspace_symbols()<CR>";
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
    key = "<leader>gb";
    mode = [
      "n"
      "v"
    ];
    options = {
      silent = true;
      desc = "Git browse";
    };
  }

  # General
  {
    action = "<cmd>nohlsearch<CR>";
    mode = "n";
    key = "<Esc>";
    options = {
      silent = true;
      desc = "Clear search highlights";
    };
  }
  {
    key = "<leader>l";
    mode = "n";
    action = ":buffer #<CR>";
    options = {
      silent = true;
      desc = "Go to last buffer";
    };
  }
  {
    mode = "v";
    key = "<leader>y";
    action = ''"+y'';
    options = {
      desc = "Yank to system clipboard";
    };
  }
  {
    key = "<leader>q";
    mode = "n";
    action = {
      __raw = ''
        function()
        local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
                return win.quickfix == 1
                end)
                    vim.cmd(is_open and "cclose" or "copen")
                                                      end
      '';
    };
    options = {
      desc = "Toggle Quickfix List";
    };
  }
]
