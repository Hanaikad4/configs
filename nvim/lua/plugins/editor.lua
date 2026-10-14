return {
  -- Jump anywhere on screen by typing a couple of letters (VSCodeVim's easymotion)
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash jump' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash select code block' },
    },
  },

  -- Auto-close brackets and quotes
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Auto-close and rename HTML/JSX tag pairs (editor.linkedEditing)
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  -- Integrated terminal (VS Code's panel terminal)
  {
    'folke/snacks.nvim',
    opts = { terminal = { enabled = true } },
    keys = {
      -- Inside the terminal, press Esc twice quickly to get back to normal mode (to scroll or copy)
      { '<leader>t', function() Snacks.terminal.toggle() end, desc = 'Toggle terminal' },
    },
  },
}
