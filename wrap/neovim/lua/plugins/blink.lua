return {
	{
		"cmp-cmdline",
		auto_enable = true,
		on_plugin = { "blink.cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"blink.compat",
		auto_enable = true,
		dep_of = { "cmp-cmdline" },
	},
	{

		"blink.cmp",
		auto_enable = true,
		event = "DeferredUIEnter",
		after = function(_)
			require("blink.cmp").setup({
				-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
				-- See :h blink-cmp-config-keymap for configuring keymaps
				keymap = {
					preset = "none",
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
					["<C-e>"] = { "hide", "fallback" },
					["<S-CR>"] = { "accept", "fallback" },

					["<Up>"] = { "snippet_forward", "fallback" },
					["<Down>"] = { "snippet_backward", "fallback" },

					["<S-Tab>"] = { "select_prev", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback_to_mappings" },
					["<C-n>"] = { "select_next", "fallback_to_mappings" },

					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },

					["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
				},
				fuzzy = {
					sorts = {
						"exact",
						-- defaults
						"score",
						"sort_text",
					},
				},
				signature = {
					enabled = true,
					window = {
						show_documentation = true,
					},
				},
				completion = {
					menu = {
						draw = {
							treesitter = { "lsp" },
							components = {
								-- customize the drawing of kind icons
								kind_icon = {
									text = function(ctx)
										-- default kind icon
										local icon = ctx.kind_icon
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == "LSP" then
											local color_item = require("nvim-highlight-colors").format(
												ctx.item.documentation,
												{ kind = ctx.kind }
											)
											if color_item and color_item.abbr ~= "" then
												icon = color_item.abbr
											end
										end
										return icon .. ctx.icon_gap
									end,
									highlight = function(ctx)
										-- default highlight group
										local highlight = "BlinkCmpKind" .. ctx.kind
										-- if LSP source, check for color derived from documentation
										if ctx.item.source_name == "LSP" then
											local color_item = require("nvim-highlight-colors").format(
												ctx.item.documentation,
												{ kind = ctx.kind }
											)
											if color_item and color_item.abbr_hl_group then
												highlight = color_item.abbr_hl_group
											end
										end
										return highlight
									end,
								},
							},
						},
					},
					documentation = {
						auto_show = true,
					},
				},
				sources = {
					default = { "lsp", "path", "buffer", "omni" },
					providers = {
						path = {
							score_offset = 50,
						},
						lsp = {
							score_offset = 40,
						},
						-- cmp_cmdline = {
						--   name = 'cmp_cmdline',
						--   module = 'blink.compat.source',
						--   score_offset = -100,
						--   opts = {
						--     cmp_name = 'cmdline',
						--   },
						-- },
					},
				},
			})
		end,
	},
}
