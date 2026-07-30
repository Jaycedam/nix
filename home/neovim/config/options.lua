vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.confirm = true -- ask for save on :q
vim.opt.breakindent = true -- continue indentation
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 3 -- global statusline
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0 -- hides cmd until used
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- vim.opt.completeopt = "menuone,noinsert,noselect,popup"
-- vim.opt.pumheight = 10 -- popup menu items
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})
