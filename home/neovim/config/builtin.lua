vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)
require("vim._core.ui2").enable({ enable = true })
