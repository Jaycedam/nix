require("catppuccin").setup({
	transparent_background = true,
})
vim.cmd("colorscheme catppuccin-mocha")

vim.uv.new_signal():start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["plugins.theme"] = nil
		package.loaded["fzf-lua"] = nil
		package.loaded["catppuccin"] = nil
		require("plugins.theme")
	end)
)
