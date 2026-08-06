require("conform").setup({
	formatters = {
		-- Manual conf for oxfmt since it's not on v9.1.0
		oxfmt = {
			command = "oxfmt",
			args = { "--stdin-filepath", "$FILENAME" },
			stdin = true,
			cwd = require("conform.util").root_file({
				".oxfmtrc.json",
				".oxfmtrc.jsonc",
				"oxfmt.config.ts",
			}),
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "oxfmt" },
		typescript = { "oxfmt" },
		javascriptreact = { "oxfmt" },
		typescriptreact = { "oxfmt" },
		json = { "oxfmt" },
		jsonc = { "oxfmt" },
		yaml = { "oxfmt" },
		toml = { "oxfmt" },
		html = { "oxfmt" },
		css = { "oxfmt" },
		scss = { "oxfmt" },
		markdown = { "oxfmt" },
		nix = { "alejandra", "nixfmt", stop_after_first = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
