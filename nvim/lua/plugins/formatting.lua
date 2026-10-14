-- Formatting with conform.nvim (what Prettier / "Format Document" do in VS Code)
--   :ConformInfo   see which formatter applies to the current file

-- Same languages Prettier formatted in VS Code
local prettier = { 'prettier' }

return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    keys = {
      -- Shift+Alt+F in VS Code (GlazeWM captures Alt)
      {
        '<leader>cf',
        function() require('conform').format { async = true } end,
        mode = { 'n', 'x' },
        desc = 'Format file/selection',
      },
      {
        '<leader>uf',
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          vim.notify('Format on save: ' .. (vim.g.disable_autoformat and 'off' or 'on'))
        end,
        desc = 'Toggle format on save',
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        vue = prettier,
        astro = prettier,
        html = prettier,
        css = prettier,
        scss = prettier,
        json = prettier,
        jsonc = prettier,
        yaml = prettier,
        markdown = prettier,
        lua = { 'stylua' },
        -- Not listed (python, go, php...): falls back to the language server's formatter
      },
      default_format_opts = { lsp_format = 'fallback' },
      format_on_save = function()
        if vim.g.disable_autoformat then return end
        return { timeout_ms = 2000 }
      end,
      formatters = {
        prettier = {
          -- Options from VS Code's settings.json. "prefer-file" makes a project's own
          -- .prettierrc win over these, same as the VS Code extension does.
          prepend_args = {
            '--config-precedence',
            'prefer-file',
            '--print-width',
            '100',
            '--single-quote',
            '--jsx-single-quote',
            '--embedded-language-formatting',
            'off',
          },
        },
      },
    },
  },

  -- Installs formatters through Mason (language servers are handled in lsp.lua)
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = 'VeryLazy',
    opts = { ensure_installed = { 'prettier', 'stylua' } },
  },
}
