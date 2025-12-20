require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = {
		menu = {
			draw = {
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		documentation = {
			auto_show = true, -- show function signature/docs
			auto_show_delay_ms = 300,
		},
		ghost_text = {
			enabled = false,
		},
	},
	signature = { enabled = true },
})
