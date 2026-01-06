{ nixvim, pkgs, ... }:
{
  imports = [
    # main nixvim module
    nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };
    plugins = {
      mini-pairs.enable = true;
      mini-statusline.enable = true;
      mini-icons.enable = true;
      mini-surround.enable = true;
      blink-cmp.enable = true;
      supermaven.enable = true;
      gitsigns.enable = true;
      which-key.enable = true;
      render-markdown.enable = true;
      colorizer.enable = true;
      flash.enable = true;

      oil = {
        enable = true;
        settings = {
          delete_to_trash = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          rust_analyzer.enable = true;
          bashls.enable = true;
          astro.enable = true;
          html.enable = true;
          tailwindcss.enable = true;
          cssls.enable = true;
          marksman.enable = true;
          lua_ls.enable = true;
          taplo.enable = true;
          yamlls.enable = true;
          nil_ls.enable = true;
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            python = [ "ruff" ];
            htmldjango = [ "djlint" ];
            javascript = [ "prettier" ];
            astro = [ "prettier" ];
            typescript = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            css = [ "prettier" ];
            scss = [ "prettier" ];
            html = [ "prettier" ];
            sh = [ "shfmt" ];
            zsh = [ "shfmt" ];
            nix = [ "nixfmt" ];
            markdown = [ "prettier" ];
            json = [ "prettier" ];
            jsonc = [ "prettier_jsonc" ];
            lua = [ "stylua" ];
          };

          format_after_save = {
            lsp_format = "fallback";
          };
        };
      };

      fzf-lua = {
        enable = true;
        keymaps = {
          "<leader>r" = {
            action = "lsp_references";
            options = {
              desc = "Find references (LSP)";
            };
          };
          "<leader>h" = {
            action = "helptags";
            options = {
              desc = "Find help";
            };
          };
          "<leader>f" = {
            action = "files";
            options = {
              desc = "Find files";
            };
          };
          "<leader>/" = {
            action = "live_grep_native";
            options = {
              desc = "Grep project";
            };
          };
          "<leader>g" = {
            action = "grep_visual";
            options = {
              desc = "Grep selection";
            };
          };
          "<leader>b" = {
            action = "buffers";
            options = {
              desc = "Find buffers";
            };
          };
          "<leader>k" = {
            action = "keymaps";
            options = {
              desc = "Find keymaps";
            };
          };
        };
      };

      lint = {
        enable = true;
        lint.linters_by_ft = {
          python = [
            "ruff"
          ];
          javascript = [
            "eslint"
          ];
          typescript = [
            "eslint"
          ];
          sh = [
            "shellcheck"
          ];
        };
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        folding.enable = true;
      };

    };
    keymaps = [
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

      {
        action = "<cmd>lua require('oil').toggle_float()<CR>";
        mode = "n";
        key = "<leader>e";
        options = {
          silent = true;
          desc = "File manager";
        };
      }
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
        mode = "n";
        key = "<leader>l";
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
        mode = "n";
        key = "<leader>q";
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
    ];
    opts = {
      number = true;
      relativenumber = true;
      winborder = "rounded";
      termguicolors = true;
      scrolloff = 10;
      ignorecase = true;
      smartcase = true;
      breakindent = true;
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      confirm = true;
      splitright = true;
      splitbelow = true;
      signcolumn = "yes";
      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];
    };
  };
}
