-- Kanso theme (same as VS Code's "Kanso Zen")
return {
  'webhooked/kanso.nvim',
  lazy = false,
  priority = 1000, -- load before everything else so all UI uses these colors
  config = function()
    require('kanso').setup {
      transparent = true, -- let WezTerm's transparency show through
    }
    vim.cmd.colorscheme 'kanso-zen'
  end,
}
