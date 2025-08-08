return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
      "onsails/lspkind.nvim",
      {
        "zbirenbaum/copilot-cmp",
        dependencies = {
          "zbirenbaum/copilot.lua",
        },
        config = function ()
          require("copilot_cmp").setup()
        end
      }
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require('lspkind')
      cmp.setup({
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind.cmp_format({
            -- mode = "symbol", -- シンボルのみ
            -- mode = "text", -- テキスト
            mode = "symbol_text", -- シンボルとテキスト
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
              path = "[Path]",
            }),
            symbol_map = {
              Copilot = ""
            }
          }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "copilot" },
          { name = "vsnip" },
          { name = "path" },
          { name = "nvim_lua" },
        }, {
          { name = 'buffer' },
        }),
        completion = {
          -- completeopt = 'menu,menuone,noinsert,noselect',
          completeopt = 'menu,menuone,noinsert',
          complete = ".,w,b,u,t"
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        preselect = cmp.PreselectMode.Item,
        -- preselect = cmp.PreselectMode.None,
        -- mapping = cmp.mapping.preset.insert({
        mapping = ({
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- ["<C-y>"] = function() end,
          ['<C-u>'] = function(fallback)
            local entry = cmp.get_active_entry()
            if (entry) then
              cmp.abort()
            else
              fallback()
            end
          end,
          ["<C-n>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<C-p>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
      })
    end
  },
}
