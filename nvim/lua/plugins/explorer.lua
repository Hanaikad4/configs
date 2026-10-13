-- Árbol de archivos a la derecha (workbench.sideBar.location = right)
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
    { '<C-b>', '<cmd>Neotree toggle<CR>', desc = 'Mostrar/ocultar árbol de archivos' },
    { '<leader>e', '<cmd>Neotree reveal<CR>', desc = 'Mostrar archivo actual en el árbol' },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = 'right',
      width = 35,
    },
    filesystem = {
      follow_current_file = { enabled = true }, -- resalta el archivo abierto
      use_libuv_file_watcher = true, -- se actualiza solo si cambian archivos
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
