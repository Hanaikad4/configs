-- Neovim entry point
-- Leader must be set before loading plugins and keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.lazy'
