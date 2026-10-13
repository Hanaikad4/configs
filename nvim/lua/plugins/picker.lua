-- Buscador: paleta de comandos, abrir archivo rápido, buscar en el proyecto
-- Usa el picker de snacks.nvim (https://github.com/folke/snacks.nvim)
return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    -- Ctrl+Shift+P y Ctrl+Shift+F los usa WezTerm, por eso se usa F1 (también abre la paleta en VS Code)
    { '<F1>', function() Snacks.picker.commands() end, desc = 'Paleta de comandos' },
    { '<C-p>', function() Snacks.picker.files() end, desc = 'Abrir archivo (Quick Open)' },
    { '<C-f>', function() Snacks.picker.lines() end, desc = 'Buscar en el archivo' },

    { '<leader>ff', function() Snacks.picker.files() end, desc = 'Archivos' },
    { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Buscar texto en el proyecto' },
    { '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Buscar palabra bajo el cursor', mode = { 'n', 'x' } },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Tabs abiertas' },
    { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Archivos recientes' },
    { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Atajos de teclado' },
    { '<leader>fh', function() Snacks.picker.help() end, desc = 'Ayuda' },
    { '<leader><leader>', function() Snacks.picker.resume() end, desc = 'Reabrir última búsqueda' },
  },
}
