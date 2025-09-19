-- ~/.config/nvim/lua/plugins/cmp.lua

return {
  -- CMP — менеджер автокомплита
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- пока не используем, но оставим для совместимости
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-emoji", -- опционально
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- пока пусто, но можно включить позже
          { name = "luasnip" },
          { name = "buffer" }, -- слова из текущего буфера
          { name = "path" },   -- пути к файлам
          { name = "emoji" },  -- опционально
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = "[Buf]",
              path = "[Path]",
              emoji = "[Emoji]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })

      -- cmdline setup
      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- Snippets engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").config.setup({})
    end,
  },
}
