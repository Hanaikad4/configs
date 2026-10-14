-- Plugin manager: lazy.nvim (https://lazy.folke.io)
-- Installs itself on first run. Each file in lua/plugins/ is a plugin or group of plugins.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = { { import = 'plugins' } },
  install = { colorscheme = { 'kanso-zen' } },
  checker = { enabled = false }, -- don't check for updates automatically; use :Lazy update
  change_detection = { notify = false },
}
