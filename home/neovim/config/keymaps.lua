-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>l", ":buffer #<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>s", function()
	local word = vim.fn.expand("<cword>")
	vim.api.nvim_feedkeys(vim.keycode(":%s/" .. word .. "//g<Left><Left>"), "n", false)
end, { desc = "Replace word under cursor" })
vim.keymap.set("v", "<leader>s", function()
	local srow, scol = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
	local ecol = vim.fn.getpos("'>")[3]
	local text = vim.fn.getline(srow):sub(scol, ecol)
	vim.api.nvim_feedkeys(vim.keycode("<Esc>:%s/\\V" .. vim.fn.escape(text, "\\/") .. "//g<Left><Left>"), "n", false)
end, { desc = "Replace visual selection" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- QoL
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves visual selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves visual selection up" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })
-- remap macro to Q
vim.keymap.set("n", "q", "<Nop>", { noremap = true })
vim.keymap.set("n", "Q", "q", { noremap = true, desc = "Record macro" })

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if vim.snippet and vim.snippet.active() then
		return vim.snippet.jump(1)
	end
	return "<Tab>"
end, { expr = true, desc = "Next snippet" })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet and vim.snippet.active() then
		return vim.snippet.jump(-1)
	end
	return "<S-Tab>"
end, { expr = true, desc = "Previous snippet" })

vim.keymap.set("n", "<leader>q", function()
	local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
		return win.quickfix == 1
	end)
	vim.cmd(is_open and "cclose" or "copen")
end, { desc = "Toggle Quickfix List" })
