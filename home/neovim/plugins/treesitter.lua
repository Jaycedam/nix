local ts_parsers = {
	"javascript",
	"typescript",
	"tsx",
	"astro",
	"lua",
	"html",
	"css",
	"bash",
	"python",
	"rust",
	"go",
}

require("nvim-treesitter").setup({
	-- fix for nixos, the dir needs to be set so it doesn't use the /store which has permissions issues.
	install_dir = vim.fn.stdpath("data") .. "/site",
	install = ts_parsers,
})
