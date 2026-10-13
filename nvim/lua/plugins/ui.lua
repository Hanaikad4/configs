return {
  -- Tabs for open files at the top
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
      { '<leader>x', function() Snacks.bufdelete() end, desc = 'Close tab' },
      { '<leader>X', function() Snacks.bufdelete.other() end, desc = 'Close other tabs' },
      { '<leader>bl', '<cmd>BufferLineMoveNext<CR>', desc = 'Move tab right' },
      { '<leader>bh', '<cmd>BufferLineMovePrev<CR>', desc = 'Move tab left' },
      { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = 'Pin tab' },
    },
    opts = {
      options = {
        close_command = function(buf) Snacks.bufdelete(buf) end,
        diagnostics = 'nvim_lsp',
        offsets = {
          -- leave space above the file tree instead of drawing tabs over it
          { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', separator = true },
        },
      },
    },
  },

  -- Bottom statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        globalstatus = true,
        component_separators = '',
        section_separators = '',
      },
      -- Sections from left (a) to right (z). Undefined ones use the defaults:
      --   a = vim mode, b = git, c = filename, y = % through file, z = line:column
      sections = {
        lualine_x = { 'encoding' }, -- without 'fileformat' (Windows icon) or 'filetype' (ps1, lua...)
      },
    },
  },

  -- Shows available keymaps after pressing <leader> (space) and waiting
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>f', group = 'Find' },
        { '<leader>b', group = 'Tabs' },
        { '<leader>c', group = 'Code' },
      },
    },
  },
}
