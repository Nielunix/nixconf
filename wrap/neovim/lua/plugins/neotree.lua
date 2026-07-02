return {
  {
  "neo-tree.nvim",
  cmd = "Neotree",
  after = function()
    require('neo-tree').setup {
    filesystem = {
      window = {
        mappings = {
          ['<leader>q'] = 'close_window',
        },
      },
    },
  }
  end
  },
  {
    "plenary.nvim",
    auto_enable = true,
    dep_of = { "neo-tree.nvim" },
  },
  {
    "nui.nvim",
    auto_enable = true,
    dep_of = { "neo-tree.nvim" },
  }
}
