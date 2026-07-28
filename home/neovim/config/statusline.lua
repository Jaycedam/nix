vim.opt.statusline = "%!v:lua.statusline()"

local function root_dir()
	local dir = vim.fn.getcwd()
	return "%#Directory#󰉋 " .. vim.fn.fnamemodify(dir, ":t") .. "%*"
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(ev)
		local buf = ev.buf
		vim.system(
			{ "git", "branch", "--show-current" },
			{ text = true },
			vim.schedule_wrap(function(out)
				if vim.api.nvim_buf_is_valid(buf) then
					vim.b[buf].git_branch = out.code == 0 and vim.trim(out.stdout) or ""
				end
			end)
		)
	end,
})

local function git_branch()
	local branch = vim.b.gitsigns_head or vim.b.git_branch or ""
	if branch ~= "" then
		return "%#gitcommitBranch#󰘬 " .. branch .. "%*"
	end
	return ""
end

local function macro_status()
	local reg = vim.fn.reg_recording()
	if reg ~= "" then
		return "%#Macro#󰑊 rec:" .. reg .. "%*"
	end
	return reg
end

-- removes bg from diagnostics hl
for _, sev in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	local hl = vim.api.nvim_get_hl(0, { name = "DiagnosticFloating" .. sev })
	hl.bg = nil
	vim.api.nvim_set_hl(0, "DiagnosticSign" .. sev, hl)
end

function _G.statusline()
	-- %= separates sections, %* resets hl groups
	return table.concat({
		"%#MiniStatuslineModeNormal# " .. vim.api.nvim_get_mode().mode:upper() .. " %*",
		root_dir(),
		git_branch(),
		macro_status(),
		"%=",
		"%<",
		"%f",
		"%m",
		"%h",
		"%=",
		vim.ui.progress_status(),
		vim.diagnostic.status(),
		"%#String#" .. "%y" .. "%*",
		"%p%% %l:%c ",
	}, " ")
end
