-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>l", ":buffer #<CR>", { silent = true, desc = "Last buffer" })
vim.keymap.set("n", "<C-c>", ":bwipeout<CR>", { silent = true, desc = "Close current buffer" })

-- clipboard and registers
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true, desc = "New tab" })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", { silent = true, desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { silent = true, desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { silent = true, desc = "Previous tab" })

-- move lines
vim.keymap.set("v", "<C-down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Moves visual selection down" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Moves visual selection down" })
vim.keymap.set("v", "<C-up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Moves visual selection up" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Moves visual selection up" })

-- center after actions and QoL
vim.keymap.set("n", "J", "mzJ`z", { silent = true, desc = "Join lines without moving cursor" })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent and keep selection" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", { silent = true, desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Previous search result cursor centered" })

-- remap macro to Q
vim.keymap.set("n", "q", "<Nop>", { noremap = true })
vim.keymap.set("n", "Q", "q", { noremap = true, desc = "Record macro" })

vim.keymap.set("n", "<leader>q", function()
	local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
		return win.quickfix == 1
	end)
	vim.cmd(is_open and "cclose" or "copen")
end, { desc = "Toggle Quickfix List" })

-- search and replace
vim.keymap.set("n", "<leader>s", function()
	local word = vim.fn.expand("<cword>")
	vim.api.nvim_feedkeys(vim.keycode(":%s/" .. word .. "//g<Left><Left>"), "n", false)
end, { desc = "Replace word under cursor" })

-- Copy file path / selection reference for pasting into AI chats
local function copy_ref(opts)
	-- "%" is the current buffer's file name; ":." makes it relative to the cwd
	local path = vim.fn.expand("%:.")
	-- ref is what ends up in the clipboard; start with just the path
	local ref = path

	if opts.visual then
		-- '< and '> are only set after leaving visual mode, so read the live selection:
		-- "v" is the line where visual mode was started (the anchor)
		local start_line = vim.fn.line("v")
		-- "." is the line the cursor is on now (the moving end of the selection)
		local end_line = vim.fn.line(".")
		-- if the selection was made upward, swap so start is always the smaller line
		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end
		-- append the range, e.g. "lua/config/keymaps.lua:1:23"
		ref = path .. ":" .. start_line .. ":" .. end_line
	end

	-- ask for an optional free-text note on the command line
	local note = vim.fn.input("Prompt: ")
	if note ~= "" then
		-- append the note after the ref, separated by a space
		ref = ref .. " " .. note
	end

	-- write ref into the "+" register, which is the system clipboard
	vim.fn.setreg("+", ref)
	-- show a confirmation message with what was copied
	vim.notify("Copied: " .. ref)
end

-- normal mode: copy just the file path
vim.keymap.set("n", "<leader>cp", function()
	copy_ref({})
end, { desc = "Copy file path" })

-- visual mode: copy the file path plus the selected line range
vim.keymap.set("v", "<leader>cp", function()
	copy_ref({ visual = true })
end, { desc = "Copy file path with line range" })
