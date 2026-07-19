return {
  {
    "mini.nvim",
    auto_load = true,
    after = function()
       if vim.g.have_nerd_font then
    require('mini.icons').setup()
    -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
    MiniIcons.mock_nvim_web_devicons()
    end
  end
  },
  {
    "mini.ai",
    auto_load = true,
    after = function()
     require('mini.ai').setup {
    -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
    mappings = {
      around_next = 'aa',
      inside_next = 'ii',
    },
    n_lines = 500,
    }
    end
  },
  {
    "mini.surround",
    auto_load = true,
    after = function()
      require('mini.surround').setup()
    end
  },
  {
    "mini.statusline",
    auto_load = true,
    after = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function() return '%2l:%-2v' end
    end
  }
}
