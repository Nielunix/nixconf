return  {

  {
    "luasnip",
    auto_enable = true,
    after = function()
      require('luasnip').setup {}
    end
  },
  {
    "friendly-snippets",
    auto_enable = true,
    dep_of = "luasnip"
  }
}
