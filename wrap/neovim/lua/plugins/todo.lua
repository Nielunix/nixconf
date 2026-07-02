return {
  "todo-comments.nvim",
  auto_enable = true,
  lazy = false,
  after = function()
    require('todo-comments').setup { signs = false }
  end
}
