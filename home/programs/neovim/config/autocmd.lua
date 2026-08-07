-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- sets a more sensible statusline fg color
-- it needs an autocmd because stylix adds the plugin at the end
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.api.nvim_set_hl(0, "Statusline", { fg = "fg", update = true })
	end,
})

-- reload config on SIGUSR1 (sent by home activation on switch)
vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	group = vim.api.nvim_create_augroup("reload-config", { clear = true }),
	callback = function()
		vim.cmd("source $MYVIMRC")
	end,
})

-- markdown task checkboxes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Toggle checkbox under cursor
		vim.keymap.set("n", "<leader>c", function()
			local line = vim.api.nvim_get_current_line()
			if line:match("%[ %]") then
				line = line:gsub("%[ %]", "[x]", 1)
			elseif line:match("%[x%]") then
				line = line:gsub("%[x%]", "[ ]", 1)
			end
			vim.api.nvim_set_current_line(line)
		end, { buffer = true, desc = "Toggle markdown task checkbox" })
	end,
})
