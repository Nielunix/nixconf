do
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
	vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic quickfix list" })

	vim.keymap.set('n', '<leader>dp', '<cmd>lua nixInfo.lze.debug.display(nixInfo.plugins)<CR>', { desc = 'Open plugins list and debug' })

	-- test dinamyque indent
	vim.keymap.set("n", "<leader>i2", "<cmd>lua vim.o.shiftwidth = 2<CR>", { desc = "set [I]ndent to [2]" })
	vim.keymap.set("n", "<leader>i4", "<cmd>lua vim.o.shiftwidth = 4<CR>", { desc = "set [I]ndent to [4]" })
	-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
	-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
	-- is not what someone will guess without a bit more experience.
	--
	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	-- Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--  See `:help wincmd` for a list of all window commands
	vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

	-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
	-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
	-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
	-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
	-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

	vim.keymap.set({ "n", "v" }, "<leader>ua>", ":lua vim.pack.update()", { desc = "update [A]ll plugins" })
	vim.keymap.set(
		{ "n", "v" },
		"<leader>ui>",
		":lua vim.pack.update(nil, { offline = true })",
		{ desc = "[I]nspect plugins states" }
	)
	
	--neotree
	vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
	
	--neogit
	vim.keymap.set(
		'n',
		'<leader>gg',
		'<cmd>Neogit<CR>',
		{ desc = "Open Neogit UI" }
	)




end
