local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	ui_select = true,
	keymap = {
		fzf = {
			["ctrl-a"] = "toggle-all",
		},
	},
	actions = {
		files = {
			true, -- inherit defaults
			["ctrl-q"] = actions.file_sel_to_qf,
		},
	},
	fzf_colors = {
		true, -- inherit from nvim theme
	},
	grep = {
		hidden = true,
		rg_opts = "--glob '!.git' --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
	},
})
-- buffers and files
vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })

-- search
vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep_native, { desc = "Grep project" })
vim.keymap.set("n", "<leader>/", require("fzf-lua").live_grep_native, { desc = "Grep project" })
vim.keymap.set("v", "<leader>/", require("fzf-lua").grep_visual, { desc = "Find visual selection" })
vim.keymap.set("n", "<leader>fw", require("fzf-lua").grep_cword, { desc = "Find word under cursor" })

vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Find help" })
-- LSP keymaps
vim.keymap.set("n", "<leader>fr", require("fzf-lua").lsp_references, { desc = "Find references (LSP)" })
vim.keymap.set("n", "<leader>fi", require("fzf-lua").lsp_implementations, { desc = "Find implementations (LSP)" })
vim.keymap.set(
	"n",
	"<leader>fD",
	require("fzf-lua").diagnostics_workspace,
	{ desc = "Find diagnostics on workspace (LSP)" }
)
vim.keymap.set(
	"n",
	"<leader>fd",
	require("fzf-lua").diagnostics_document,
	{ desc = "Find diagnostics on current buffer (LSP)" }
)
vim.keymap.set("n", "<leader>fs", require("fzf-lua").lsp_document_symbols, { desc = "Find document symbols (LSP)" })
vim.keymap.set("n", "<leader>fS", require("fzf-lua").lsp_workspace_symbols, { desc = "Find workspace symbols (LSP)" })
vim.keymap.set("n", "<leader>fa", require("fzf-lua").lsp_code_actions, { desc = "Code actions" })
-- Neovim
vim.keymap.set("n", "<leader>fm", require("fzf-lua").marks, { desc = "Find marks" })

-- Custom
_G.fzf_projects = function(opts)
	local fzf_lua = require("fzf-lua")
	local projects_dir = vim.fn.expand("~/Projects")
	opts = opts or {}
	opts.prompt = "Projects > "
	opts.cwd = opts.cwd or projects_dir
	opts.actions = {
		["default"] = function(selected)
			vim.cmd("cd " .. projects_dir .. "/" .. selected[1])
			vim.cmd("edit .")
		end,
	}
	fzf_lua.fzf_exec("fd --type d --max-depth 1", opts)
end
vim.keymap.set("n", "<leader>fp", _G.fzf_projects)
