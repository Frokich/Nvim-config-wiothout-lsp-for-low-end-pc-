-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- рекомендуется стабильная ветка
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Настройка lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins.core" },
    { import = "plugins.ui" },
    { import = "plugins.cmp" },
    { import = "plugins.terminal" },
  },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tar",
        "zip",
        "netrwPlugin",
        "tohtml",
        "tutor",
        "rplugin",
        "syntax",
        "matchit",
        "matchparen",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})
