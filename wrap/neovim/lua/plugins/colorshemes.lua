return {
	{
		-- lze specs need a name
		"trigger_colorscheme",
		-- lazy loaded colorscheme.
		-- This means you will need to add the colorscheme you want to lze sometime before VimEnter is done
		event = "VimEnter",
		-- Also, lze can load more than just plugins.
		-- The default load field contains vim.cmd.packadd
		-- Here we override it to schedule when our colorscheme is loaded
		load = function(_name)
			-- schedule so it runs after VimEnter
			vim.schedule(function()
				vim.cmd.colorscheme(nixInfo("onedark", "settings", "colorscheme"))
			end)
		end,
	},
	{
		-- :lua nixInfo.lze.debug.display(nixInfo.plugins)
		-- The display function is from lzextras
		"onedarkpro.nvim",
		auto_enable = true, -- <- auto enable is useful here
		colorscheme = { "onedark", "onedark_dark", "onedark_vivid", "onelight" },
	},
	{
		"vim-moonfly-colors",
		auto_enable = true,
		colorscheme = "moonfly",
		after = function ()
			vim.g.moonflyCursorColor = true
			vim.g.moonflyItalics = false
			vim.g.moonflyNormalPmenu = true
			vim.g.moonflyNormalFloat = true
			vim.g.moonflyTerminalColors = false
			vim.g.moonflyTransparent = true
			vim.g.moonflyUndercurls = false
			vim.g.moonflyUnderlineMatchParen = true
			vim.g.moonflyVirtualTextColor = true
			vim.cmd("colorscheme moonfly")
		end
	},
	{
		"gruvbox.nvim",
		auto_enable = true,
		colorscheme = "gruvbox",
		after = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
