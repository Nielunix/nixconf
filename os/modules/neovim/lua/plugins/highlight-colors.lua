return {
	"nvim-highlight-colors",
	lazy = false,
	auto_load = true,
	after = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			virtual_symbol = "",
			virtual_symbol_prefix = " ",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "eow",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_ansi = true,
			enable_xterm256 = true,
			enable_xtermTrueColor = true,
			enable_hsl_without_function = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = false,
		})
	end,
}
