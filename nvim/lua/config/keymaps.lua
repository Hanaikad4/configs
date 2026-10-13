-- Atajos generales. Los de cada plugin están en su archivo dentro de lua/plugins/.
local map = vim.keymap.set

-- ============================================================
-- Traídos de VSCodeVim (settings.json)
-- ============================================================
map('i', 'jj', '<Esc>', { desc = 'Salir de modo insertar' })
map('n', '<leader>d', 'dd', { desc = 'Borrar línea' })
map('n', '<C-n>', '<cmd>nohlsearch<CR>', { desc = 'Quitar resaltado de búsqueda' })
map('n', 'K', 'i<CR><Esc>', { desc = 'Partir línea en el cursor' })

-- ============================================================
-- Estilo VS Code
-- ============================================================
map({ 'n', 'i', 'v' }, '<C-s>', '<cmd>write<CR><Esc>', { desc = 'Guardar' })
map('n', '<C-a>', 'ggVG', { desc = 'Seleccionar todo' })

-- Mover líneas (Alt+Flechas en VS Code). Alt lo captura GlazeWM, así que se usa
-- J/K en modo visual: selecciona con V y mueve con J/K.
map('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Mover selección abajo', silent = true })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Mover selección arriba', silent = true })

-- Mantener la selección al indentar con < y >
map('v', '<', '<gv')
map('v', '>', '>gv')

-- ============================================================
-- Ventanas (splits)
-- ============================================================
-- Moverse entre ventanas con Ctrl+hjkl (incluye el árbol de archivos)
map('n', '<C-h>', '<C-w>h', { desc = 'Ventana izquierda' })
map('n', '<C-j>', '<C-w>j', { desc = 'Ventana abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Ventana arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Ventana derecha' })

map('n', '<leader>\\', '<cmd>vsplit<CR>', { desc = 'Dividir a la derecha' }) -- Ctrl+\ en VS Code
map('n', '<leader>-', '<cmd>split<CR>', { desc = 'Dividir abajo' })

-- ============================================================
-- Tabs (buffers)
-- ============================================================
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Tab siguiente' })
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Tab anterior' })
