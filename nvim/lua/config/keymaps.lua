-- General keymaps. Plugin keymaps live in their own file under lua/plugins/.
local map = vim.keymap.set

-- ============================================================
-- Ported from VSCodeVim (settings.json)
-- ============================================================
map('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
map('n', '<leader>d', 'dd', { desc = 'Delete line' })
map('n', '<C-n>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
map('n', 'K', 'i<CR><Esc>', { desc = 'Split line at cursor' })

-- ============================================================
-- VS Code style
-- ============================================================
map({ 'n', 'i', 'v' }, '<C-s>', '<cmd>write<CR><Esc>', { desc = 'Save' })
map('n', '<C-a>', 'ggVG', { desc = 'Select all' })

-- Move lines (Alt+Arrows in VS Code). GlazeWM captures Alt, so use
-- J/K in visual mode instead: select with V and move with J/K.
map('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move selection down', silent = true })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move selection up', silent = true })

-- Keep selection when indenting with < and >
map('v', '<', '<gv')
map('v', '>', '>gv')

-- ============================================================
-- Windows (splits)
-- ============================================================
-- Move between windows with Ctrl+hjkl (includes the file tree)
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

map('n', '<leader>\\', '<cmd>vsplit<CR>', { desc = 'Split right' }) -- Ctrl+\ in VS Code
map('n', '<leader>-', '<cmd>split<CR>', { desc = 'Split down' })

-- ============================================================
-- Tabs (buffers)
-- ============================================================
map('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next tab' })
map('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Previous tab' })
