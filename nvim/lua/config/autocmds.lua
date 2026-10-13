local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('user', { clear = true })

-- Relative numbers only in normal mode (VSCodeVim's vim.smartRelativeLine)
autocmd({ 'InsertEnter', 'FocusLost', 'WinLeave' }, {
  group = group,
  callback = function()
    if vim.wo.number then vim.wo.relativenumber = false end
  end,
})
autocmd({ 'InsertLeave', 'FocusGained', 'WinEnter' }, {
  group = group,
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= 'i' then vim.wo.relativenumber = true end
  end,
})

-- Briefly highlight yanked text
autocmd('TextYankPost', {
  group = group,
  callback = function() vim.hl.on_yank() end,
})
