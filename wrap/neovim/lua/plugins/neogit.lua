return {
  "neogit",
  lazy = true,
  cmd = "Neogit",
  after = function()
    require('neogit').setup()
  end
}
