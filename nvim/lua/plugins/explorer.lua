-- File tree on the right (workbench.sideBar.location = right)
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-b>', '<cmd>Neotree toggle<CR>', desc = 'Toggle file tree' },
    { '<leader>e', '<cmd>Neotree reveal<CR>', desc = 'Reveal current file in tree' },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = 'right',
      width = 35,
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- highlight the open file
      use_libuv_file_watcher = true, -- auto-refresh when files change
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
