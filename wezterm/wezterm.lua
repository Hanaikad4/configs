-- Configuración de WezTerm
-- Docs: https://wezterm.org/config/files.html
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ============================================================
-- Shell
-- ============================================================
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- ============================================================
-- Apariencia
-- ============================================================
config.color_scheme = 'Kanagawa (Gogh)'

config.font = wezterm.font_with_fallback {
  'Cascadia Code',
  'Consolas',
}
config.font_size = 20
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' } -- ligaduras

-- Transparencia (en Windows 11 puedes probar 'Acrylic' o 'Mica')
config.window_background_opacity = 0.80
-- config.win32_system_backdrop = 'Acrylic'

config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
config.window_decorations = 'RESIZE' -- sin barra de título (útil con GlazeWM)

-- ============================================================
-- Pestañas
-- ============================================================
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- ============================================================
-- Comportamiento
-- ============================================================
config.scrollback_lines = 10000
config.audible_bell = 'Disabled'
config.window_close_confirmation = 'NeverPrompt'
config.check_for_updates = false

-- ============================================================
-- Atajos
-- ============================================================
-- WezTerm ya trae muchos atajos por defecto (ver `wezterm show-keys`):
--   Ctrl+Shift+T          nueva pestaña
--   Ctrl+Shift+N          nueva ventana
--   Ctrl+Tab / +Shift     siguiente / anterior pestaña
--   Ctrl+Shift+1..9       ir a la pestaña N
--   Ctrl+Shift+PgUp/PgDn  mover pestaña a la izquierda / derecha
--   Ctrl+Shift+Flechas    moverse entre paneles
--   Ctrl+Shift+Z          zoom al panel actual (pantalla completa / volver)
--   Ctrl+Shift+F          buscar
--   Ctrl+Shift+X          modo copia (seleccionar con teclado)
--   Ctrl+Shift+P          paleta de comandos (busca cualquier acción)
--   Ctrl+ +/-/0           tamaño de fuente
-- Abajo solo van los que se agregan o cambian.
local act = wezterm.action

config.keys = {
  -- Dividir paneles. Se usa Ctrl+Shift porque GlazeWM captura Alt y Alt+Shift.
  { key = 'd', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } }, -- a la derecha
  { key = 's', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },   -- abajo

  -- Moverse entre paneles con hjkl (las flechas Ctrl+Shift+Flechas siguen funcionando).
  -- Reemplaza Ctrl+Shift+K (limpiar scrollback) y Ctrl+Shift+L (overlay de debug);
  -- ambos siguen disponibles desde la paleta de comandos (Ctrl+Shift+P).
  { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },

  -- Redimensionar paneles con Ctrl+Shift+Alt+hjkl (en celdas)
  { key = 'h', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'j', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'k', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'l', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 5 } },

  -- Cerrar panel actual (si es el único, cierra la pestaña)
  { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
}

return config
