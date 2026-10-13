-- Tema Kanso (el mismo que "Kanso Zen" de VS Code)
return {
  'webhooked/kanso.nvim',
  lazy = false,
  priority = 1000, -- cargar antes que el resto para que todo use estos colores
  config = function()
    require('kanso').setup {
      transparent = true, -- deja ver la transparencia de WezTerm
    }
    vim.cmd.colorscheme 'kanso-zen'
  end,
}
