vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })
-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })
