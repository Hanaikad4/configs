-- Opciones del editor (equivalente a settings.json de VS Code)
local opt = vim.opt

-- Números de línea relativos (vim.smartRelativeLine: absolutos en modo insertar, ver autocmds.lua)
opt.number = true
opt.relativenumber = true

-- Indentación: 2 espacios (editor.tabSize = 2, editor.detectIndentation = false)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Portapapeles del sistema (vim.useSystemClipboard)
opt.clipboard = 'unnamedplus'

-- Búsqueda (vim.incsearch, vim.hlsearch)
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true -- distingue mayúsculas solo si escribes alguna

-- Apariencia
opt.termguicolors = true
opt.signcolumn = 'yes' -- columna fija para git/errores, evita que el texto salte
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.showmatch = false -- editor.matchBrackets = never
opt.showmode = false -- el modo ya se ve en la barra de estado
opt.laststatus = 3 -- una sola barra de estado global, como VS Code
opt.fillchars = { eob = ' ' } -- oculta los ~ al final del archivo

-- Ventanas nuevas abren a la derecha y abajo
opt.splitright = true
opt.splitbelow = true

-- Varios
opt.mouse = 'a'
opt.undofile = true -- historial de deshacer persistente entre sesiones
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 400 -- tiempo para completar combinaciones como jj o <leader>...
opt.confirm = true -- pregunta en vez de fallar al cerrar con cambios sin guardar
