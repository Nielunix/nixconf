return {
	"which-key.nvim",
	auto_enable = true,
	event = "DeferredUIEnter",
	after = function()
		require("which-key").setup({
			-- Delay between pressing a key and opening which-key (milliseconds)
			delay = 0,

			preset = "classic",
			icons = { mappings = vim.g.have_nerd_font },
			colors = true,
			-- Document existing key chains
			spec = {
				{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
				{ "<leader>u", group = "[U]pdate", mode = { "n", "v" } },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } }, -- Enable gitsigns recommended keymaps first
				{ "gr", group = "LSP Actions", mode = { "n" } },
			},
		})
	end,
}
