local ts_parsers = {
	"astro",
	"bash",
	"css",
	"diff",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"html",
	"htmldjango",
	"hyprlang",
	"ini",
	"javascript",
	"json",
	"jsx",
	"kdl",
	"kitty",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"nu",
	"python",
	"rust",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"yaml",
}

require("nvim-treesitter").setup({
	-- fix for nixos, otherwise it uses /store which is read only
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install(ts_parsers)
