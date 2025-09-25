-- ~/.config/nvim/lua/plugins/ui.lua

return {
  -- Статус-лайн
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
      })
    end,
  },

  -- Indent.
  {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "toggleterm",
      },
    },
  },
},

  -- Todo
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      signs = true,
      sign_priority = 10,
      keywords = {
        FIX = {
          icon = " ", --   
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^%s*(%*|-)", -- поддержка списков
        multiline_context = 3,
      },
    })

    -- Быстрый поиск TODO
    vim.keymap.set("n", "]t", "<cmd>TodoTelescope<cr>", { desc = "Next TODO" })
    vim.keymap.set("n", "[t", "<cmd>TodoTelescope<cr>", { desc = "Prev TODO" })
  end,
  },

  { "bluz71/vim-moonfly-colors",
  name = "moonfly",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd [[colorscheme moonfly]]
    vim.g.moonflyTerminalColors = false
    vim.g.moonflyTransparent = true
  end,


  },

  -- Файловое дерево
  {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
        popup = {
          border = "rounded",
          highlight = "Normal",
        },
      },

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },

      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = nil,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        modified = {
          symbol = "●",
          color = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
        },
        git_status = {
          symbols = {
            added     = "",
            deleted   = "",
            ignored   = "◌",
            renamed   = "",
            staged    = "",
            untracked = "",
            unmerged  = "",
          },
        },
      },

      diagnostics = {
        symbols = {
          error = "",
          warning = "",
          info = "",
          hint = "",
        },
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>f", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })
  end,
  },

  -- Иконки
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },

  {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- for file icons
  },
  config = function()
    require('dashboard').setup({
      theme = 'hyper', -- try 'doom', 'alpha', 'dark' for different styles

      config = {
        -- Header (logo)
        header = {
          type = 'text',
          val = {
            ' ██████╗ ███████╗██╗  ██╗██╗███╗   ██╗███████╗ ',
            ' ██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝ ',
            ' ██║  ██║█████╗  ███████║██║██╔██╗ ██║█████╗   ',
            ' ██║  ██║██╔══╝  ██╔══██║██║██║╚██╗██║██╔══╝   ',
            ' ██████╔╝███████╗██║  ██║██║██║ ╚████║███████╗ ',
            ' ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝ ',
            '                                               ',
            '    ███╗   ██╗██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗     ',
            '    ████╗  ██║██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗    ',
            '    ██╔██╗ ██║██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝    ',
            '    ██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██╗██╔══╝  ██╔══██╗    ',
            '    ██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗██║  ██║    ',
            '    ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝    ',
          },
          opts = {
            position = 'center',
            hl = 'Keyword',
          },
        },

        -- Shortcuts (all in English)
        shortcut = {
          {
            desc = '  Recent Files',
            group = '@property',
            action = 'Telescope oldfiles',
            key = 'f',
          },
          {
            desc = '󰈞  Find File',
            group = '@property',
            action = 'Telescope find_files',
            key = 'e',
          },
          {
            desc = '  NVIM Config',
            group = '@property',
            action = 'e ~/.config/nvim/init.lua',
            key = 'c',
          },
          {
            desc = '  Plugins',
            group = '@property',
            action = 'Lazy',
            key = 'p',
          },
          {
            desc = '  Terminal',
            group = '@property',
            action = 'ToggleTerm',
            key = 't',
          },
          {
            desc = '  Quit NVIM',
            group = '@property',
            action = 'qa',
            key = 'q',
          },
        },

        -- Recent files section
        recent_files = {
          label = 'Recent Files',
          path = vim.fn.stdpath('data') .. '/lazy/dashboard-nvim/.db',
          limit = 10,
          icon = ' ',
          group = '@text',
        },

        -- Footer with plugin load time
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { 'Loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,

        -- Week header
        week_header = {
          enable = true,
          align = 'center',
          format = 'dd mmm yyyy',
        },

        -- Disable default motd
        motd = false,

        -- Colors
        colors = {
          folder = 'Directory',
          link = 'Comment',
          file = 'Normal',
          modified = 'String',
          readonly = 'WarningMsg',
          terminal = 'Keyword',
          date = 'Comment',
        },

        -- Padding
        padding = {
          top = 3,
          bottom = 3,
        },

        -- Show on startup
        on_startup = true,
      },
    })

    -- Optional: disable netrw at startup (recommended for dashboard)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  },
}
