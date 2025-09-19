-- ~/.config/nvim/lua/config/options.lua

vim.schedule(function()
  local setopt = function(key, value)
    pcall(function()
      vim.opt[key] = value
    end)
  end

  -- Основные опции
  setopt('encoding', 'UTF-8')
  setopt('fileencoding', 'UTF-8')
  setopt('number', true)
  setopt('relativenumber', true)
  setopt('tabstop', 2)
  setopt('softtabstop', 2)
  setopt('shiftwidth', 2)
  setopt('expandtab', true)
  setopt('smartindent', true)
  setopt('wrap', false)
  setopt('swapfile', false)
  setopt('backup', false)
  setopt('undofile', true)
  setopt('hlsearch', false)
  setopt('incsearch', true)
  setopt('termguicolors', true)
  setopt('scrolloff', 8)
  setopt('signcolumn', 'yes')
  setopt('updatetime', 50)
  setopt('timeoutlen', 300)

  -- Безопасное добавление к isfname
  pcall(function()
    vim.opt.isfname:append("@-@")
  end)

  -- Автосохранение
  pcall(function()
    vim.cmd([[autocmd BufLeave,FocusLost * silent! wall]])
  end)
end)
