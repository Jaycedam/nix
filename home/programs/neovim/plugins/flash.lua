require("flash").setup({
	rainbow = {
		enabled = true,
	},
})

-- flash
vim.keymap.set({ "n", "x", "o" }, "gw", function()
	require("flash").jump()
end, { desc = "Go to word" })
vim.keymap.set({ "n", "x", "o" }, "gW", function()
	require("flash").treesitter()
end, { desc = "Go to word (treesitter)" })
