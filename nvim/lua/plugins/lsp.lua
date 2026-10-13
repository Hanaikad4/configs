-- LSP: completion, go to definition, inline diagnostics, etc. (what Pylance, TS, ... do in VS Code)
--   :Mason        view/install/update servers
--   :LspInfo      see which servers are active in the current file (alias for :checkhealth vim.lsp)

-- Servers installed automatically by Mason (nvim-lspconfig names)
local servers = {
  'basedpyright', -- Python (similar to Pylance)
  'vtsls', -- JavaScript / TypeScript (uses the same engine as VS Code)
  'vue_ls', -- Vue (works together with vtsls)
  'astro',
  'html',
  'cssls',
  'jsonls',
  'yamlls',
  'emmet_language_server', -- Emmet abbreviations in HTML/JSX, like VS Code
  'gopls', -- Go
  'intelephense', -- PHP
  'lua_ls', -- Lua (for editing this config)
}

return {
  {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'mason-org/mason.nvim', cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' }, opts = { ui = { border = 'rounded' } } },
      'neovim/nvim-lspconfig', -- provides the base config for each server
      'saghen/blink.cmp',
    },
    config = function()
      -- ========================================================
      -- Per-server settings (merged with nvim-lspconfig's)
      -- ========================================================
      vim.lsp.config('basedpyright', {
        settings = {
          basedpyright = { analysis = { typeCheckingMode = 'standard' } }, -- same as VS Code
        },
        -- Use the project's venv if present (venv/ or .venv/ at the root)
        before_init = function(_, config)
          for _, name in ipairs { 'venv', '.venv' } do
            local python = vim.fs.joinpath(config.root_dir or '', name, 'Scripts', 'python.exe')
            if vim.uv.fs_stat(python) then
              config.settings.python = { pythonPath = python }
              return
            end
          end
        end,
      })

      -- Vue: vtsls handles TypeScript inside .vue files through the Vue plugin
      vim.lsp.config('vtsls', {
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                  languages = { 'vue' },
                  configNamespace = 'typescript',
                },
              },
            },
          },
          -- js/ts.updateImportsOnFileMove = always
          typescript = { updateImportsOnFileMove = { enabled = 'always' } },
          javascript = { updateImportsOnFileMove = { enabled = 'always' } },
        },
      })

      -- Extra completion capabilities (snippets, etc.) for all servers
      vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })

      -- Install missing servers and enable everything installed through Mason
      require('mason-lspconfig').setup { ensure_installed = servers }

      -- ========================================================
      -- Diagnostics (errors and warnings)
      -- ========================================================
      vim.diagnostic.config {
        severity_sort = true,
        virtual_text = { spacing = 2, prefix = '●' }, -- message at the end of the line
        float = { border = 'rounded', source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
          },
        },
      }

      -- ========================================================
      -- Keymaps (only in buffers with an active server)
      -- ========================================================
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
        callback = function(ev)
          local function map(keys, fn, desc, mode)
            vim.keymap.set(mode or 'n', keys, fn, { buffer = ev.buf, desc = desc, nowait = true })
          end

          -- Navigation (shows a list to pick from when there are several results)
          map('gd', function() Snacks.picker.lsp_definitions() end, 'Go to definition (F12)')
          map('gD', vim.lsp.buf.declaration, 'Go to declaration')
          map('gr', function() Snacks.picker.lsp_references() end, 'Find references (Shift+F12)')
          map('gi', function() Snacks.picker.lsp_implementations() end, 'Go to implementation')
          map('gy', function() Snacks.picker.lsp_type_definitions() end, 'Go to type definition')
          map('<F12>', function() Snacks.picker.lsp_definitions() end, 'Go to definition')

          -- Info (K is used to split lines, gh is VSCodeVim's hover key)
          map('gh', vim.lsp.buf.hover, 'Show documentation (hover)')
          map('<C-k>', vim.lsp.buf.signature_help, 'Signature help', 'i')

          -- Actions
          map('<F2>', vim.lsp.buf.rename, 'Rename symbol')
          map('<leader>cr', vim.lsp.buf.rename, 'Rename symbol')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code actions (Ctrl+.)', { 'n', 'x' })
          map('<leader>.', vim.lsp.buf.code_action, 'Code actions (Ctrl+.)', { 'n', 'x' })

          -- Diagnostics
          map('<leader>cd', vim.diagnostic.open_float, 'Line diagnostics')
          map('<leader>fs', function() Snacks.picker.lsp_symbols() end, 'File symbols (Ctrl+Shift+O)')
          map('<leader>fS', function() Snacks.picker.lsp_workspace_symbols() end, 'Workspace symbols (Ctrl+T)')
        end,
      })

      -- Project-wide diagnostics list (Problems panel, Ctrl+Shift+M)
      vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { desc = 'Problems (errors/warnings)' })
    end,
  },

  -- Completion
  {
    'saghen/blink.cmp',
    version = '1.*', -- uses the prebuilt fuzzy matcher binary
    event = 'InsertEnter',
    opts = {
      keymap = {
        -- Enter accepts, so does Tab (like VS Code), Ctrl+Space opens the menu, arrows or Ctrl+n/p to navigate
        preset = 'enter',
        ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        menu = { border = 'rounded' },
      },
      signature = { enabled = true }, -- show parameters while typing a call
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
    },
  },

  -- Makes lua_ls aware of the Neovim API when editing this config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } },
    },
  },
}
