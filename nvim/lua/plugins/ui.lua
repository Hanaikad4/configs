return {
  -- Tabs de archivos abiertos arriba
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    keys = {
      { '<leader>x', function() Snacks.bufdelete() end, desc = 'Cerrar tab' },
      { '<leader>X', function() Snacks.bufdelete.other() end, desc = 'Cerrar las demás tabs' },
      { '<leader>bl', '<cmd>BufferLineMoveNext<CR>', desc = 'Mover tab a la derecha' },
      { '<leader>bh', '<cmd>BufferLineMovePrev<CR>', desc = 'Mover tab a la izquierda' },
      { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = 'Fijar tab' },
    },
    opts = {
      options = {
        close_command = function(buf) Snacks.bufdelete(buf) end,
        diagnostics = 'nvim_lsp',
        offsets = {
          -- deja espacio sobre el árbol de archivos en vez de tapar sus tabs
          { filetype = 'neo-tree', text = 'Explorador', highlight = 'Directory', separator = true },
        },
      },
    },
  },

  -- Barra de estado inferior
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
      -- Secciones de izquierda (a) a derecha (z). Las que no se definen usan el valor por defecto:
      --   a = modo de vim, b = git, c = nombre de archivo, y = % del archivo, z = línea:columna
      sections = {
        lualine_x = { 'encoding' }, -- sin 'fileformat' (icono de Windows) ni 'filetype' (ps1, lua...)
      },
    },
  },

  -- Muestra los atajos disponibles al presionar <leader> (espacio) y esperar
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>f', group = 'Buscar' },
        { '<leader>b', group = 'Tabs' },
      },
    },
  },
}
