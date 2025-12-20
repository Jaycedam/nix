local state = {
	buf = nil,
	win = nil,
}

local function close_terminal()
	local win = state.win
	local buf = state.buf

	state.win = nil
	state.buf = nil

	if win and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_win_close(win, true)
	end
	if buf and vim.api.nvim_buf_is_valid(buf) then
		vim.api.nvim_buf_delete(buf, { force = true })
	end
end

local function open_window()
	state.win = vim.api.nvim_open_win(state.buf, true, {
		split = "below",
		win = vim.api.nvim_get_current_win(),
		height = 12,
	})
	vim.wo[state.win].winfixheight = true
end

local function toggle_terminal()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_hide(state.win)
		state.win = nil
		return
	elseif not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
		state.buf = vim.api.nvim_create_buf(false, false)
		open_window()
		vim.api.nvim_create_autocmd("TermClose", {
			buffer = state.buf,
			once = true,
			callback = vim.schedule_wrap(close_terminal),
		})
		vim.fn.jobstart(vim.o.shell, { term = true })
	else
		open_window()
	end

	vim.cmd.startinsert()
end

vim.keymap.set({ "n", "t" }, "<C-/>", toggle_terminal, { desc = "Toggle terminal" })
