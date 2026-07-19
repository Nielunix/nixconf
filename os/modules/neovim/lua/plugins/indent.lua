return {
  "indent-blankline.nvim",
  lazy = false,
  auto_load = true,
  after = function()
    require('ibl').setup {}
  end
}
