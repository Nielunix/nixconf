return {
  {
  "neo-tree.nvim",
  cmd = "Neotree",
  after = function()
    require('neo-tree').setup {
     filesystem = {
      window = {
        width = 28,
        mappings = {
          ['<leader>q'] = 'close_window',
        },
      },
    },
  }
  end
  },
  {
    "nui.nvim",
    auto_enable = true,
    dep_of = { "neo-tree.nvim" },
  }
}
