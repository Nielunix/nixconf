return {
    {
    "cmp-cmdline",
    auto_enable = true,
    on_plugin = { "blink.cmp" },
    load = nixInfo.lze.loaders.with_after,
  },
  {
    "blink.compat",
    auto_enable = true,
    dep_of = { "cmp-cmdline" },
  },
  {

"blink.cmp",
    auto_enable = true,
    event = "DeferredUIEnter",
    after = function (_)
      require("blink.cmp").setup({
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- See :h blink-cmp-config-keymap for configuring keymaps
        keymap =  {
          preset = 'none',
          ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide', 'fallback' },
          ['<S-CR>'] = { 'accept', 'fallback' },

          ['<Up>'] = { 'snippet_forward', 'fallback' },
          ['<Down>'] = { 'snippet_backward', 'fallback' },

          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<Tab>'] = { 'select_next', 'fallback' },
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

          ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
          ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

          ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        -- cmdline = {
        --   enabled = true,
        --   completion = {
        --     menu = {
        --       auto_show = true,
        --     },
        --   },
        --   sources = function()
        --     local type = vim.fn.getcmdtype()
        --     -- Search forward and backward
        --     if type == '/' or type == '?' then return { 'buffer' } end
        --     -- Commands
        --     if type == ':' or type == '@' then return { 'cmdline', 'cmp_cmdline' } end
        --     return {}
        --   end,
        -- },
        fuzzy = {
          sorts = {
            'exact',
            -- defaults
            'score',
            'sort_text',
          },
        },
        signature = {
          enabled = true,
          window = {
            show_documentation = true,
          },
        },
        completion = {
          menu = {
            draw = {
              treesitter = { 'lsp' },
              -- components = {
              --   label = {
              --     text = function(ctx)
              --       return require("colorful-menu").blink_components_text(ctx)
              --     end,
              --     highlight = function(ctx)
              --       return require("colorful-menu").blink_components_highlight(ctx)
              --     end,
              --   },
              -- },
            },
          },
          documentation = {
            auto_show = true,
          },
        },
        sources = {
          default = { 'lsp', 'path', 'buffer', 'omni' },
          providers = {
            path = {
              score_offset = 50,
            },
            lsp = {
              score_offset = 40,
            },
            -- cmp_cmdline = {
            --   name = 'cmp_cmdline',
            --   module = 'blink.compat.source',
            --   score_offset = -100,
            --   opts = {
            --     cmp_name = 'cmdline',
            --   },
            -- },
          },
        },
      })
    end,
  }
  }
