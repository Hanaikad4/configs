-- Editor options (equivalent to VS Code's settings.json)
local opt = vim.opt

-- Relative line numbers (vim.smartRelativeLine: absolute in insert mode, see autocmds.lua)
opt.number = true
opt.relativenumber = true

-- Indentation: 2 spaces (editor.tabSize = 2, editor.detectIndentation = false)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- System clipboard (vim.useSystemClipboard)
opt.clipboard = 'unnamedplus'

-- Search (vim.incsearch, vim.hlsearch)
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true -- case-sensitive only if the pattern has uppercase

-- Appearance
opt.termguicolors = true
opt.signcolumn = 'yes' -- always-visible column for git/diagnostics, avoids text shifting
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.showmatch = false -- editor.matchBrackets = never
opt.showmode = false -- mode is already shown in the statusline
opt.laststatus = 3 -- single global statusline, like VS Code
opt.fillchars = { eob = ' ' } -- hide the ~ after end of file

-- New windows open to the right and below
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.mouse = 'a'
opt.undofile = true -- persistent undo history across sessions
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 400 -- time to complete key sequences like jj or <leader>...
opt.confirm = true -- ask instead of failing when closing with unsaved changes

-- Disable providers for plugins written in Python/Node/Ruby/Perl (unused).
-- Without this, opening a .py file makes Neovim probe Python and fail with pyenv shims.
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
