-- Punto de entrada de Neovim
-- El leader tiene que definirse antes de cargar plugins y atajos
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.lazy'
