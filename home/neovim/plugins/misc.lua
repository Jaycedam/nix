-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)
-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true })

-- simgle config / no config
require("supermaven-nvim").setup({})
require("nvim-autopairs").setup({})
require("colorizer").setup()
require("nvim-web-devicons").setup()
require("which-key").setup({
	preset = "helix",
	delay = 500,
})
