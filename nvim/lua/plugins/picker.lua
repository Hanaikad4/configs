-- Picker: command palette, quick open, project search
-- Uses the snacks.nvim picker (https://github.com/folke/snacks.nvim)
return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    -- WezTerm uses Ctrl+Shift+P and Ctrl+Shift+F, so F1 is used instead (it also opens the palette in VS Code)
    { '<F1>', function() Snacks.picker.commands() end, desc = 'Command palette' },
    { '<C-p>', function() Snacks.picker.files() end, desc = 'Open file (Quick Open)' },
    { '<C-f>', function() Snacks.picker.lines() end, desc = 'Search in file' },

    { '<leader>ff', function() Snacks.picker.files() end, desc = 'Files' },
    { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Search text in project' },
    { '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Search word under cursor', mode = { 'n', 'x' } },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Open tabs' },
    { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent files' },
    { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
    { '<leader>fh', function() Snacks.picker.help() end, desc = 'Help' },
    { '<leader><leader>', function() Snacks.picker.resume() end, desc = 'Resume last search' },
  },
}
