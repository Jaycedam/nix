local fzf = require("fzf-lua")

fzf.setup({
	ui_select = {},
	winopts = {
		-- disable background
		backdrop = 100,
	},
	hls = {
		normal = "Normal",
		border = "Normal",
		preview_normal = "Normal",
		preview_border = "Normal",
	},
	fzf_colors = {
		true, -- inherit from nvim theme
		["bg"] = "-1",
		["gutter"] = "-1",
	},
	grep = {
		rg_opts = "--hidden --glob=!.git/* --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
	},
	keymap = {
		fzf = {
			true,
			["ctrl-d"] = "preview-page-down",
			["ctrl-u"] = "preview-page-up",
			["ctrl-q"] = "select-all+accept",
			["ctrl-a"] = "select-all",
		},
		builtin = {
			true,
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
		},
	},
})
-- buffers and files
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
-- vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })

-- search
-- vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, { desc = "Grep project" })
-- vim.keymap.set("v", "<leader>fg", fzf.grep_visual, { desc = "Find visual selection" })
-- vim.keymap.set("n", "<leader>/", fzf.live_grep_native, { desc = "Grep project" })
-- vim.keymap.set("v", "<leader>/", fzf.grep_visual, { desc = "Find visual selection" })
-- vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Find word under cursor" })
-- vim.keymap.set("n", "<leader>fW", fzf.grep_cWORD, { desc = "Find WORD under cursor" })

vim.keymap.set("n", "<leader>fz", fzf.zoxide, { desc = "Find zoxide directory" })

vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Find help" })
-- LSP keymaps
vim.keymap.set("n", "<leader>fr", fzf.lsp_references, { desc = "Find references (LSP)" })
vim.keymap.set("n", "<leader>fi", fzf.lsp_implementations, { desc = "Find implementations (LSP)" })
vim.keymap.set("n", "<leader>fD", fzf.diagnostics_workspace, { desc = "Find diagnostics on workspace (LSP)" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "Find diagnostics on current buffer (LSP)" })
vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Find document symbols (LSP)" })
vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "Find workspace symbols (LSP)" })
vim.keymap.set("n", "<leader>fa", fzf.lsp_code_actions, { desc = "Code actions" })
-- Neovim
vim.keymap.set("n", "<leader>fm", fzf.marks, { desc = "Find marks" })

-- Custom
_G.fzf_projects = function(opts)
	opts = opts or {}
	opts.prompt = "Change Project > "
	opts.cwd = opts.cwd or vim.fn.expand("~/Projects")
	opts.actions = {
		["default"] = function(selected)
			local project_path = vim.fn.expand(opts.cwd) .. "/" .. selected[1]
			vim.cmd("cd " .. project_path)
			vim.cmd("edit .")
		end,
	}
	fzf.fzf_exec("fd --type d --max-depth 1 --format '{/}'", opts)
end
vim.keymap.set("n", "<leader>fp", _G.fzf_projects, { desc = "Find projects" })
