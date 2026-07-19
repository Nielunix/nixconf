do
	-- Highlight on yank
	local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			vim.highlight.on_yank()
		end,
		group = highlight_group,
		pattern = "*",
	})
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			-- Link which-key's floating window to the main text background
			vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
			-- Make the which-key border match your standard floating borders
			vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })
		end,
	})
	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			if vim.bo.modifiable then
				-- FIX: Safely grab the lint module inside the callback
				local status_ok, nvim_lint = pcall(require, "lint")
				if status_ok then
					nvim_lint.try_lint()
				end
			end
		end,
	})
end
