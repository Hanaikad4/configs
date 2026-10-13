-- Gestor de plugins: lazy.nvim (https://lazy.folke.io)
-- Se instala solo la primera vez. Cada archivo en lua/plugins/ es un plugin o grupo de plugins.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = { { import = 'plugins' } },
  install = { colorscheme = { 'kanso-zen' } },
  checker = { enabled = false }, -- no buscar actualizaciones solo; usa :Lazy update
  change_detection = { notify = false },
}
