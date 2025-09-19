-- ~/.config/nvim/lua/plugins/terminal.lua

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15, -- высота терминала
        open_mapping = [[<C-\>]], -- если хочешь свою клавишу
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal", -- терминал внизу
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 15, -- прозрачность
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- 🎯 Кеймапы как в LazyVim
      vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: Go to left window" })
      vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: Go to lower window" })
      vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: Go to upper window" })
      vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: Go to right window" })

      -- 🎯 Основной toggle — как в LazyVim: <C-;>
      vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
      vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", { desc = "Toggle Terminal from insert" })
    end,
  },
}
