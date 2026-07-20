do
	-- NOTE: Globals
	vim.g.mapleader = " "
	vim.g.maplocallleader = " "
	vim.g.have_nerd_font = true

	-- NOTE: Options
	vim.o.wrap = false
	vim.o.number = true
	vim.o.relativenumber = true
	vim.o.mouse = "a"
	vim.o.showmode = false
	vim.o.clipboard = "unnamedplus"
	vim.o.breakindent = true
	vim.o.undofile = true
	vim.o.ignorecase = true
	vim.o.shiftwidth = 2
	vim.o.smartindent = true
	vim.o.autoindent = true
	vim.o.tabstop = 2
	vim.o.softtabstop = 2

	vim.o.smartcase = true
	vim.o.signcolumn = "yes"
	-- Decrease update time
	vim.o.updatetime = 250
	-- Decrease mapped sequence wait time
	vim.o.timeoutlen = 300
	-- Configure how new splits should be opened
	vim.o.splitright = true
	vim.o.splitbelow = true
	vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

	-- Preview substitutions live, as you type!
	vim.o.inccommand = "split"
	vim.o.cursorline = true
	vim.o.scrolloff = 10
	vim.o.confirm = true
	vim.o.termguicolors = true
	vim.o.hlsearch = true
	vim.o.completeopt = "menu,preview,noselect"

	-- NOTE: hilight bug corrector
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
end
