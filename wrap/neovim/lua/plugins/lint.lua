return {
	"nvim-lint",
	after = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "markdownlint" }, -- Make sure to install `markdownlint` via mason / npm
		}
	end,
}
