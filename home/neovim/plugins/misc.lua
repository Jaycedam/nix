-- plugin init
require("colorizer").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require("mini.pairs").setup()
require("which-key").setup({ preset = "helix", delay = 500 })

-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })
-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })

vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
