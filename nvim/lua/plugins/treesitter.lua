-- Treesitter-based syntax highlighting and indentation
-- Requires on PATH: tree-sitter (winget: tree-sitter.tree-sitter-cli)
--                   gcc         (winget: BrechtSanders.WinLibs.POSIX.UCRT)
-- To add a language: add it to the list or run :TSInstall <language>

local parsers = {
  -- Neovim / config
  'lua',
  'vim',
  'vimdoc',
  'query',
  'regex',
  'bash',
  'powershell',
  'markdown',
  'markdown_inline',
  'json',
  'yaml',
  'toml',
  -- Web
  'html',
  'css',
  'scss',
  'javascript',
  'typescript',
  'tsx',
  'jsdoc',
  'astro',
  'vue',
  -- Other languages
  'python',
  'go',
  'gomod',
  'php',
  'ruby',
  'sql',
  'dockerfile',
  -- Git
  'gitignore',
  'gitcommit',
  'diff',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  init = function()
    -- On Windows tree-sitter defaults to cl.exe (Visual Studio); tell it to use gcc
    vim.env.CC = vim.env.CC or 'gcc'
  end,
  config = function()
    -- Installs missing parsers in the background (first run only)
    require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter', { clear = true }),
      callback = function(ev)
        -- pcall: if there's no parser for the language, keep vim's basic highlighting
        if pcall(vim.treesitter.start, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
