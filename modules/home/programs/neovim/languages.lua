-- LSP
vim.lsp.enable("pyright")
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("bashls")
vim.lsp.enable("astro")
vim.lsp.enable("html")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")
vim.lsp.enable("marksman")
vim.lsp.enable("lua_ls")
vim.lsp.enable("taplo")
vim.lsp.enable("yamlls")
vim.lsp.enable("nil_ls") -- nix lsp

-- FORMATTER
require("conform").setup({
	formatters_by_ft = {
		python = { "ruff" },
		rust = { "rustfmt" },
		htmldjango = { "djlint" },
		javascript = { "prettier" },
		astro = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		nix = { "nixfmt" },
		markdown = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier_jsonc" },
		lua = { "stylua" },
	},
	format_after_save = {
		lsp_format = "fallback",
	},
	formatters = {
		shfmt = {
			prepend_args = { "-i", "4" },
		},
		prettier = {
			append_args = { "--tab-width", "4" },
		},
		prettier_jsonc = {
			command = "prettier",
			append_args = { "--tab-width", "4" },
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--trailing-comma",
				"none",
			},
		},
	},
})

-- LINTER
local lint = require("lint")

lint.linters.shellcheck.args = {
	"-x", -- follow sourced files
}

lint.linters_by_ft = {
	python = {
		"ruff",
	},
	javascript = {
		"eslint",
	},
	typescript = {
		"eslint",
	},
	sh = {
		"shellcheck",
	},
	rust = {
		"clippy",
	},
	nix = {
		"statix",
	},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint(nil, {
			-- ignore_errors = true,
		})
	end,
})
