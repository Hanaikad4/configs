return {
  -- Change markers in the gutter, hunk actions and blame (VS Code's gutter + GitLens)
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      current_line_blame = false, -- off like in VS Code (git.blame.editorDecoration.enabled = false)
      on_attach = function(buf)
        local gs = require 'gitsigns'
        local function map(mode, keys, fn, desc) vim.keymap.set(mode, keys, fn, { buffer = buf, desc = desc }) end

        -- Jump between changes
        map('n', ']h', function() gs.nav_hunk 'next' end, 'Next change')
        map('n', '[h', function() gs.nav_hunk 'prev' end, 'Previous change')

        -- Act on the change under the cursor (or the selected lines)
        map('n', '<leader>gp', gs.preview_hunk, 'Preview change')
        map({ 'n', 'x' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', 'Stage change')
        map({ 'n', 'x' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', 'Discard change')
        map('n', '<leader>gS', gs.stage_buffer, 'Stage file')
        map('n', '<leader>gR', gs.reset_buffer, 'Discard file changes')

        -- Blame and diff
        map('n', '<leader>gb', function() gs.blame_line { full = true } end, 'Blame line')
        map('n', '<leader>gB', gs.toggle_current_line_blame, 'Toggle inline blame')
        map('n', '<leader>gd', gs.diffthis, 'Diff file against last commit')
      end,
    },
  },

  -- lazygit (full git UI, like VS Code's Source Control panel) and git pickers, through snacks
  {
    'folke/snacks.nvim',
    opts = { lazygit = { enabled = true } },
    keys = {
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git log' },
      { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git log for current file' },
      { '<leader>gc', function() Snacks.picker.git_status() end, desc = 'Changed files' },
      { '<leader>go', function() Snacks.gitbrowse() end, desc = 'Open in browser (GitHub...)', mode = { 'n', 'x' } },
    },
  },
}
